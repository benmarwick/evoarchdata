##########################################################################################
# Source Code for reproducing analysis presented on:

# Crema, E.R., Edinborough, K., Kerig, T., Shennan, S.J. "An Approximate Bayesian Computation approach for inferring patterns of cultural evolutionary change"  on Journal of Archaeological Science.

# Please contact E.Crema (e.crema@ucl.ac.uk; enrico.crema@gmail.com) for any enquiries.
##########################################################################################
library(abc)



########## Core model of cultural transmission (see paper for details) ##########

culturalTransmission<-function(timesteps=1000,warmup=5000,Ne=500,mu=0.001,b=0.02,z=0.1)
{

traitSpace=1:999999 #sample space of all possible variants
currentPop=sample(traitSpace,size=Ne,replace=TRUE) #initialise population of agents

#start warmup runs ...
for (t in 1:warmup)
{

#cultural transmission
if (length(unique(currentPop))>1)
{
sampleSpace <- table(currentPop)
sampleSpace <- sampleSpace^(1 - b) #frequency bias
index <- runif(Ne) < z #retention bias
copiers <- currentPop[index]
noncopiers <- currentPop[!index]
copied <- sample(size = length(copiers), x = as.numeric(names(sampleSpace)), 
                replace = TRUE, prob = sampleSpace)
currentPop <- c(copied, noncopiers)
}

#innovation
index <- which(runif(Ne) < mu)
if (length(index) > 0) {
newTraits <- sample(traitSpace, size = length(index), 
                replace = TRUE)
currentPop[index] = newTraits
        }
}
#... finish warmup runs

#create matrix for storing output
resmatrix=matrix(NA,nrow=Ne,ncol=timesteps)
resmatrix[,1]=currentPop

#main simulation
for (t in 2:timesteps)
{

#transmission
if (length(unique(resmatrix[,t-1]))>1)
{
sampleSpace <- table(resmatrix[,t-1])
sampleSpace <- sampleSpace^(1 - b) #frequency bias
index <- runif(Ne) < z #retention bias
copiers <- resmatrix[index,t-1]
noncopiers <- resmatrix[!index,t-1]
copied <- sample(size = length(copiers), x = as.numeric(names(sampleSpace)),replace = TRUE, prob = sampleSpace)
resmatrix[,t] <- c(copied, noncopiers)
}
else {resmatrix[,t]=resmatrix[,t-1]}

#innovation
index <- which(runif(Ne) < mu)
if (length(index) > 0) {
newTraits <- sample(traitSpace, size = length(index), 
                replace = TRUE)
resmatrix[index,t] = newTraits
        }
}


return(resmatrix)
}


##########################################################################

############## utlity function required in culturalTransmission() function ##########

instances <- function(x, variants) {
        x = c(x, variants)
        res <- table(x) - 1
        return(res)
    }
    

########## Function for retrieving sample and integrating time-averaging effect ##########


# Input parameters:
# samplesizes ... the number of sample objects to retrieve per block
# sampleblocks ... two column data.frame defining the start and end timesteps of each block
# resmatrix ... raw output of the culturalTransmission() function

sampler<-function(resmatrix,samplesizes,sampleblocks)
{
allTraits<-unique(as.numeric(resmatrix))    
nsamp<-length(samplesizes)
bind<-vector("list",length=nsamp)
for (x in 1:nsamp)
    {
        bind[[x]]<-sample(x=resmatrix[,sampleblocks[x,1]:sampleblocks[x,2]],size=samplesizes[x],replace=TRUE)
    }

resraw<-t(sapply(bind,instances,variants=allTraits))
return(resraw)
}

##########################################################################





########## Modified Functions from the abc package ##########

#NOTE: Notice that both functions are stripped down version of the original code with extremely limited functionalities. They should be used with caution, and some of the original codes might have been left despite not being used. 


# this is the modified version of the abc() function in the abc package which allows the evaluation of a distribution, rather than a single point target.

# -target is a matrix with each row corresponding to different bootstrap iterations 
# -The function randomly draws a vector of values from the target distribution
# -most of the functionalities of abc is disabled and only the rejection method is available.


abc2<-function (target, param, sumstat, tol, ...) 
{
require(abc)
        transf = "none"
        method="rejection"
        hcorr <- TRUE
        rejmethod <- TRUE
        logit.bounds = c(0, 0)

    if (is.data.frame(param)) 
        param <- as.matrix(param)
    if (is.data.frame(sumstat)) 
        sumstat <- as.matrix(sumstat)
    if (is.vector(sumstat)) 
        sumstat <- matrix(sumstat, ncol = 1)
        
    nss <- length(sumstat[1, ])
        
    cond1 <- !any(as.logical(apply(sumstat, 2, function(x) length(unique(x)) - 
        1)))
    if (cond1) 
        stop("Zero variance in the summary statistics.")
    ltransf <- length(transf)
    if (is.vector(param)) {
        numparam <- 1
        param <- matrix(param, ncol = 1)
    }
    else numparam <- dim(param)[2]

    if (rejmethod) {
        transf[1:numparam] <- "none"
    }
    else {
        if (numparam != ltransf) {
            if (length(transf) == 1) {
                transf <- rep(transf[1], numparam)
                warning("All parameters are \"", transf[1], "\" transformed.", 
                  sep = "", call. = F)
            }
            else stop("Number of parameters is not the same as number of transformations.", 
                sep = "", call. = F)
        }
    }
    gwt <- rep(TRUE, length(sumstat[, 1])) #vector of TRUEs with length equal to the number of simulations
    gwt[attributes(na.omit(sumstat))$na.action] <- FALSE
    subset <- rep(TRUE, length(sumstat[, 1]))
    gwt <- as.logical(gwt * subset)

     paramnames <- colnames(param)
     statnames <- colnames(sumstat)
    scaled.sumstat <- sumstat
    for (j in 1:nss) {
        scaled.sumstat[, j] <- normalise(sumstat[, j], sumstat[, 
            j][gwt])
    }

    #normalise the observed target
   for (jj in 1:nrow(target))
       {
    for (j in 1:nss) {
        target[jj,j] <- normalise(target[jj,j], sumstat[, j][gwt]) # ****
    }
}
        
    sum1 <- 0
    for (j in 1:nss) {
        sum1 <- sum1 + (scaled.sumstat[, j] - target[sample(1:nrow(target),size=nrow(sumstat),replace=TRUE),j])^2 # ****  /// This calculates the difference
    }

    dist <- sqrt(sum1)
    dist[!gwt] <- floor(max(dist[gwt]) + 10)
    nacc <- ceiling(length(dist) * tol)
    ds <- sort(dist)[nacc]
    wt1 <- (dist <= ds)
    aux <- cumsum(wt1)
    wt1 <- wt1 & (aux <= nacc)

    ss <- sumstat[wt1, ]
    unadj.values <- param[wt1, ]
    statvar <- as.logical(apply(cbind(sumstat[wt1, ]), 2, function(x) length(unique(x)) - 
        1))
    cond2 <- !any(statvar)
    if (cond2 && !rejmethod) 
        stop("Zero variance in the summary statistics in the selected region. Try: checking summary statistics, choosing larger tolerance, or rejection method.")
    if (rejmethod) {
        if (cond2) 
            warning("Zero variance in the summary statistics in the selected region. Check summary statistics, consider larger tolerance.")
        weights <- rep(1, length = sum(wt1))
        adj.values <- NULL
        residuals <- NULL
        lambda <- NULL
    }
    else {
        if (cond2) 
            cat("Warning messages:\nStatistic(s)", statnames[!statvar], 
                "has/have zero variance in the selected region.\nConsider using larger tolerance or the rejection method or discard this/these statistics, which might solve the collinearity problem in 'lsfit'.\n", 
                sep = ", ")
    }
    if (numparam == 1) {
        unadj.values <- matrix(unadj.values, ncol = 1)
    }
    abc.return(transf, logit.bounds, method, call, numparam, 
        nss, paramnames, statnames, unadj.values, adj.values, 
        ss, weights, residuals, dist, wt1, gwt, lambda, hcorr, 
        aic, bic)
}
environment(abc2)<-environment(abc)


# this is the modified version of the postpr() function in the abc package which allows the evaluation of a distribution, rather than a single point target.

# -target is a matrix with each row corresponding to different bootstrap iterations 
# -The function randomly draws a vector of values from the target distribution
# -most of the functionalities of abc is disabled and only the rejection method is available.



postpr2<-function (target, index, sumstat, tol, corr = TRUE, ...) 
{
    require(abc)
    method="rejection"
    linout <- FALSE
    rejmethod <- TRUE
    if (is.data.frame(sumstat)) 
        sumstat <- as.matrix(sumstat)
    if (is.vector(sumstat)) 
        sumstat <- matrix(sumstat, ncol = 1)
    if (length(index) != length(sumstat[, 1])) 
        stop("'index' must be the same length as the number of rows in 'sumstat'.", 
            call. = F)

    if (is.vector(sumstat)) 
        sumstat <- matrix(sumstat, ncol = 1)
    index <- factor(index)
    mymodels <- levels(index)
    gwt <- rep(TRUE, length(sumstat[, 1]))
    gwt[attributes(na.omit(sumstat))$na.action] <- FALSE
    subset <- rep(TRUE, length(sumstat[, 1]))
    gwt <- as.logical(gwt * subset)
    sumstat <- as.data.frame(sumstat)
    nss <- length(sumstat[1, ])
    statnames <- paste("S", 1:nss, sep = "")
    cond1 <- as.logical(apply(sumstat, 2, function(x) length(unique(x)) - 
        1))
    if (!all(cond1)) 
        stop("Summary statistic(s) have zero variance.", call. = F)
    if (!any(cond1)) {
        warning("Statistic(s) ", statnames[!cond1], " have zero variance. Excluding from estimation....", 
            sep = "\t", call. = F, immediate = T)
        sumstat <- sumstat[, cond1]
        nss <- length(sumstat[1, ])
        statnames <- colnames(sumstat)
        target <- target[cond1]
    }
    scaled.sumstat <- sumstat
    for (j in 1:nss) {
        scaled.sumstat[, j] <- normalise(sumstat[, j], sumstat[, 
            j][gwt])
    }

    
 pb <- txtProgressBar(min = 0, max = nrow(target), style = 3)

   for (jj in 1:nrow(target))
       {
setTxtProgressBar(pb, jj)
    for (j in 1:nss) {
        target[jj,j] <- normalise(target[jj,j], sumstat[, j][gwt]) # ****
    }
}
 close(pb)


    
    sum1 <- 0
    for (j in 1:nss) {
        sum1 <- sum1 + (scaled.sumstat[, j] - target[sample(1:nrow(target),size=nrow(sumstat),replace=TRUE),j])^2 # ****  /// This calculates the difference
    }
    
    dist <- sqrt(sum1)
    dist[!gwt] <- floor(max(dist[gwt]) + 10)
    abstol <- quantile(dist, tol)
        nacc <- ceiling(length(dist) * tol)
        ds <- sort(dist)[nacc]
        wt1 <- (dist <= ds)
        aux <- cumsum(wt1)
        wt1 <- wt1 & (aux <= nacc)
    ss <- scaled.sumstat[wt1, ]
    values <- index[wt1]
    pred <- table(values)/length(values)
    statvar <- as.logical(apply(scaled.sumstat[wt1, , drop = FALSE], 
        2, function(x) length(unique(x)) - 1))
    cond2 <- !any(statvar)
    if (cond2 && !rejmethod) 
        stop("Zero variance in the summary statistics in the selected region.\nTry: checking summary statistics, choosing larger tolerance, or rejection method.", 
            call. = F)
    if (rejmethod) {
        if (cond2) 
            warning("Zero variance in the summary statistics in the selected region. Check summary statistics, consider larger tolerance.", 
                call. = F, immediate = T)
        weights <- NULL
        pred.logit <- NULL
    }
    if (rejmethod) {
        postpr.out <- list(values = values, ss = ss, call = call, 
            na.action = gwt, method = method, corr = corr, nmodels = table(index), 
            numstat = nss, names = list(models = mymodels, statistics.names = statnames))
    }
    class(postpr.out) <- "postpr"
    invisible(postpr.out)
}
environment(postpr2)<-environment(postpr)


