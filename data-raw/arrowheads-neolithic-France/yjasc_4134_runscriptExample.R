# The following example illustrate the workflow executed in the paper "An Approximate Bayesian Computation approach for inferring patterns of cultural evolutionary change" by Crema et al. on Journal of Archaeological Science.
# The actual execution of the workflow differ at STEP 4, as this was optimised for the execution on a High Performance Cluster.
# The code has been tested for R version 3.0.2, and used the following R packages and their dependencies:
# abc (version 1.8)
# vegan  (version 2.0-10)


# Please contact E.Crema (e.crema@ucl.ac.uk; enrico.crema@gmail.com) for any enquiries.


##################################################
# STEP 1:  source R scripts and load R libraries #
##################################################

# load libraries
library(abc)
library(vegan)

# Source code
source("./src.R")

# Import raw data
data<-read.csv("data.csv",header=TRUE,row.names=1)





################################################################
# STEP 2: Compute number of transmission events per time-block #
################################################################

numberOfTransmissionEventsPerYear=1
obsSampleSize<-c(2,0,3,0,21,0,21,0,56,54,0,30,41,52) #this includes zeros for artificial "gap" timeblocks
startDates<-c(3700,3600,3450,3450,3200,3200,3100,3100,3050,3010,2930,2850,2750,2600)
endDates<-c(3600,3450,3450,3200,3200,3100,3100,3050,3010,2930,2850,2750,2600,1650)
transmissionEvents<-(startDates-endDates)/numberOfTransmissionEventsPerYear
#notice that the numnbe

start<-numeric()
end<-numeric()
timesteps=1
for (x in 1:length(obsSampleSize))
    {
        start[x]=timesteps
        if (transmissionEvents[x]>0)
        {SEQ<-seq.int(timesteps,length.out=transmissionEvents[x])}
        #notice that the number of transmission events is rounded by the seq.int() function
        else {SEQ=timesteps}
        end[x]=SEQ[length(SEQ)]
        timesteps=end[x]
        if (transmissionEvents[x]>0)
        {timesteps=timesteps+1}
    }

startend<-data.frame(start=start,end=end)


##############################################
# STEP 3 compute observed summary statistics #
##############################################

#calculate  observed cultural distances
morisitaHornDist<-vegdist(data,"horn")
observed<-as.numeric(morisitaHornDist)
numOb<-length(observed)

#bootstrap analysis
nBoots<-1000 #define number of bootstrap simulations
bootRes<-matrix(NA,ncol=numOb,nrow=nBoots)


for (x in 1:nBoots)
  {  
tmp<-t(apply(data,1,function(x,names){return(instances(sample(x=names,size=sum(x),replace=TRUE,prob=x),variants=names))},names=colnames(data)))
bootRes[x,]<-as.numeric(vegdist(tmp,"horn"))
  }


#########################
# STEP 4 run simulation #
#########################

#fix parameters
timesteps=startend$end[nrow(startend)]

#define prior ranges
priorMu<-c(0.0001,0.05)
priorNe<-c(50,1000)
priorZ<-c(1/30,1/15)
priorBab<-c(0,0.5)
priorBcb<-c(-0.5,0)


#define number of simulations for each model
nsim=5  #this is an example with just 100 runs, the original paper conducted 100,000 runs

#define parameter space

# Unbiased Model
simparamUB<-data.frame(mu=runif(nsim,min=priorMu[1],max=priorMu[2]),Ne=round(runif(nsim,min=priorNe[1],max=priorNe[2])),z=runif(nsim,min=priorZ[1],max=priorZ[2]))

# AntiConformist Bias Model:
simparamAB<-data.frame(mu=runif(nsim,min=priorMu[1],max=priorMu[2]),Ne=round(runif(nsim,min=priorNe[1],max=priorNe[2])),z=runif(nsim,min=priorZ[1],max=priorZ[2]),b=runif(nsim,min=priorBab[1],max=priorBab[2]))

# Conformist Bias Model:
simparamCB<-data.frame(mu=runif(nsim,min=priorMu[1],max=priorMu[2]),Ne=round(runif(nsim,min=priorNe[1],max=priorNe[2])),z=runif(nsim,min=priorZ[1],max=priorZ[2]),b=runif(nsim,min=priorBcb[1],max=priorBcb[2]))


#create matrix for storing simultaed summary statistics
simresUB<-matrix(NA,nrow=nsim,ncol=numOb)
simresAB<-matrix(NA,nrow=nsim,ncol=numOb)
simresCB<-matrix(NA,nrow=nsim,ncol=numOb)

#FROM HERE

#run simulation loop (this will take a LOT of time!!!)

for (s in 1:nsim)
    {
      #unbiased model:  
      tmpUB<-culturalTransmission(Ne=simparamUB$Ne[s],mu=simparamUB$mu[s],z=simparamUB$z[s],b=0,timesteps=timesteps,warmup=30000)

      #anti-conformist bias model:
      tmpAB<-culturalTransmission(Ne=simparamAB$Ne[s],mu=simparamAB$mu[s],z=simparamUB$z[s],b=simparamAB$b[s],timesteps=timesteps,warmup=30000)


      #anti-conformist bias model:
      tmpCB<-culturalTransmission(Ne=simparamAB$Ne[s],mu=simparamAB$mu[s],z=simparamUB$z[s],b=simparamAB$b[s],timesteps=timesteps,warmup=30000)


#### Sampling from simulation output...

      tmpUB<-sampler(tmpUB,samplesizes=obsSampleSize,sampleblocks=startend)
      if(nrow(tmpUB)>1)
      {tmpUB<-tmpUB[which(obsSampleSize>0),]} #remove phases without samples
      if (any(apply(tmpUB,2,sum)>0)){
      tmpUB<-tmpUB[,which(apply(tmpUB,2,sum)>0)]} #remove variants that are not observed

      tmpAB<-sampler(tmpAB,samplesizes=obsSampleSize,sampleblocks=startend)
      if(nrow(tmpAB)>1)
      {tmpAB<-tmpAB[which(obsSampleSize>0),]} #remove phases without samples
      if (any(apply(tmpAB,2,sum)>0)){
      tmpAB<-tmpAB[,which(apply(tmpAB,2,sum)>0)]} #remove variants that are not observed

      tmpCB<-sampler(tmpCB,samplesizes=obsSampleSize,sampleblocks=startend)
      if(nrow(tmpCB)>1)
      {tmpCB<-tmpCB[which(obsSampleSize>0),]} #remove phases without samples
      if (any(apply(tmpCB,2,sum)>0)){
      tmpCB<-tmpCB[,which(apply(tmpCB,2,sum)>0)]} #remove variants that are not observed

#store results

      simresUB[s,]<-as.numeric(vegdist(tmpUB,"horn")) 
      simresAB[s,]<-as.numeric(vegdist(tmpAB,"horn")) 
      simresCB[s,]<-as.numeric(vegdist(tmpCB,"horn")) 

    }

###############
# STEP 5  ABC #
###############

#NOTE: Notice the example below includes all data-points, including those of phases I and II

# estimate parameter posteriors (example for unbiased transmission)

#e.g. (standard approach)
UBpost1<-abc(target=observed,sumstat=simresUB,param=simparamUB,tol=0.01,method="rejection")

#e.g. (bootstrap approach)
UBpost2<-abc2(target=bootRes,sumstat=simresUB,param=simparamUB,tol=0.01,method="rejection")

#posterior values can then be examined
#e.g.
summary(UBpost1$unadj.values)
hist(UBpost1$unadj.values[,1])




# model selection:
nsim=100 #number of simulations, should be identical for all models
models<-c(rep("UB",nsim),rep("AB",nsim),rep("CB",nsim))

#e.g. (standard approach)
modelCompare1<-postpr(target=observed,index=models,sumstat=rbind(simresUB,simresAB,simresCB),tol=0.01,method="rejection")
#e.g. (bootstrap approach)
modelCompare2<-postpr2(target=bootRes,index=models,sumstat=rbind(simresUB,simresAB,simresCB),tol=0.01,method="rejection")


#the results of the model selection can be examined with the summary function:

#e.g.
summary(modelCompare1)


#############################
# STEP 6 Hypothesis Testing #
#############################

#expected value

nsim #number of simulations for the hypothesis testing (i.e. total number of simulation multiplied by the tolerance level)
index=34 #index is the specific value in the observed summary statistic
hist(simresUB[UBpost1$region,index],xlim=c(0,1),xlab="Dissimilarity",col="lightgrey") #histogram of expected value
abline(v=observed[index],lty=2) #observed value

#one-sided p-values:
1-sum(simresUB[UBpost1$region,index]<observed[index])/nsim #larger than expected
1-sum(simresUB[UBpost1$region,index]>observed[index])/nsim #smaller than expected

