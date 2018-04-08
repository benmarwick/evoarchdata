
# from https://github.com/mnewberry/ldrift/blob/master/helper.R
FIT.test  = function(df, one.sided=FALSE) {
  # Perform the Fitness Increment Test (Feder et al. 2014)
  # Args:
  #   df: binned data frame with three columns
  #     df$year : the midpoint year of a bin
  #     df$value : the number of tokens in a bin of variant 1
  #     df$count : the total number of tokens in a bin
  #
  # Returns:
  #   FIT.p: the p-value returned by the FIT test
  #   FIT.stat: the test statistic of the FIT test
  #   Y.bar: the average of the scaled fitness increments
  #   n: number of bins
  #   mu: average number of tokens per bin
  #   sigma: standard deviation of number of tokens per bin
  #   W.stat: test statistic of Shapiro-Wilk test for normality
  #   W.p: p-value for Shapiro-Wilk test
  #
  # Get number of bins from data
  q = nrow(df)
  # Create vector to hold fitness increments
  Y = rep(0,(q-1))
  # Get variant frequencies from df
  v = df$value/df$count
  # Get years from df
  t = df$year
  # Rescale increments according to definition
  for (i in c(2:q)) { # R indexes from 1 rather than 0
    Y[i-1] = (v[i] - v[i - 1])/sqrt(2*v[i-1]*(1 - v[i-1])*(t[i] - t[i-1]))
  }
  # Mean fitness increment
  Y.bar = mean(Y)
  # Get t statistic from rescaled fitness increments
  FIT.stat = as.numeric(t.test(Y)$statistic)
  # Calculate the p-value for the test statistic:
  FIT.p = t.test(Y)$p.value
  if (one.sided) {FIT.p = t.test(Y, alternative="greater")$p.value}
  # Get mean number of tokens per bin
  mu = floor(mean(df$count))
  # Get standard deviation of tokens across bins
  sigma = floor(sd(df$count))
  # Shapiro-Wilk test :
  #   Note that H_0 assumes that rescaled increments are normally distributed
  W.stat = shapiro.test(Y)$statistic
  W.p = shapiro.test(Y)$p.value
  # return values in vector
  values = list(FIT.p=FIT.p, FIT.stat=FIT.stat, Y.bar=Y.bar, q=q, mu=mu, sigma=sigma,
                W.stat=W.stat, W.p=W.p)
  return(values)
}




library(evoarchdata)
data(ceramics_lbk_merzbach)

# and then take a look at the data
ceramics_lbk_merzbach

# see how the freqs of each change over time
library(tidyverse)

ceramics_lbk_merzbach_long <-
ceramics_lbk_merzbach %>%
  gather(variable, value, -Phase)


  ggplot(ceramics_lbk_merzbach_long,
         aes(Phase,
             value)) +
  geom_point() +
  facet_wrap(~variable,
             scales = "free_y") +
  theme_minimal()

#   df: binned data frame with three columns
#     df$year : the midpoint year of a bin
#     df$value : the number of tokens in a bin of variant 1
#     df$count : the total number of tokens in a bin

df <- ceramics_lbk_merzbach[ , 2:ncol(ceramics_lbk_merzbach)]
year <- ceramics_lbk_merzbach$Phase
year_num <- utils:::.roman2numeric(year)

list_of_dfs <- vector("list", ncol(df))

for(i in 1:ncol(df)){
tmp <-
  data.frame(year = 1:nrow(df),
             value = df[, i],
             count = rowSums(df[, (seq_len(ncol(df)))[-i]   ]))

list_of_dfs[[i]] <- tmp # [which(tmp$value != 0 ), ]
}

# attach style names
names(list_of_dfs) <- names(ceramics_lbk_merzbach)[-1]

# remove rows with 0
list_of_dfs_no_zero <- map(list_of_dfs,
                           ~setNames(.x, c("year", "value", "count")) %>%
                             .[which(.[,2] != 0 ), ])

fit_safely <- safely(FIT.test)

df_fit_test_results <-
  list_of_dfs_no_zero %>%
  bind_rows(.id = "type") %>%
  nest(-type) %>%
  mutate(fit_test = map(data,
                        ~fit_safely(.x))) %>%
  mutate(fit_p = map(fit_test, ~.x$result %>% bind_rows)) %>%
  unnest(fit_p) %>%
  mutate(sig = ifelse(FIT.p <= 0.05, "selection", "neutral"))

ceramics_lbk_merzbach_long_sig <-
  ceramics_lbk_merzbach_long %>%
  left_join(df_fit_test_results, by = c("variable" = "type")) %>%
  mutate(Phase_num = utils:::.roman2numeric(Phase))

ggplot(ceramics_lbk_merzbach_long_sig,
       aes(Phase_num,
           value,
           colour = sig,
           shape = sig,
           group = variable)) +
  geom_point() +
  geom_line() +
  facet_wrap(~variable,
             scales = "free_y") +
  theme_minimal()

# The distribution of nominal FIT P values is non-uniform (Kolmogorov–Smirnov P < 0.0001), which confirms that some styles experience selection.
ceramics_lbk_merzbach_long_sig %>%
  group_by(variable) %>%
  distinct(FIT.p) %>%
  filter(!is.na(FIT.p)) %>%
  ggplot(aes(FIT.p)) +
  geom_histogram() +
  xlab("FIT p-value") +
  theme_minimal(base_size = 14)

ceramics_lbk_merzbach_long_sig %>%
  group_by(variable) %>%
  distinct(FIT.p) %>%
  filter(!is.na(FIT.p)) %>%
  pull(FIT.p) %>%
  ks.test(., "pnorm")

# https://github.com/mnewberry/tsinfer for selection coefficient



