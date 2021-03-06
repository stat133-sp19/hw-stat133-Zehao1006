
About the motivation
--------------------

This package has been developed as a practive of R package creation.

Brief introduction
------------------

`"binomial"` is a [R](http://www.r-project.org/) package that implements functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

-   `"bin_variable()"` creates a binomial random variable (of class `"binvar"`).
-   `"bin_probability()"` calculates the probability.
-   `"bin_distribution()"` calculates the probability distribution and creates a object of class `"bindis"`.
-   `"bin_cumulative()"` calculates the cumulative probability and creates a object of class `"bincum"`.
-   `"bin_mean()"`, `"bin_variance()"`, `"bin_mode()"`, `"bin_skewness()"`, `"bin_kurtosis()"` calculates the corresponding statistics as the name suggests.
-   `summary()` method for a `"binvar"` object.
-   `plot()` method for a `"bindis"` object to plot the probability histogram and method for a `"bincum"` object to graph the probability cumulative distribution.

Getting started with "binoial"
------------------------------

``` r
library('binomial')

# to calculate the probability of a binomial random variable
bin_probability(success = 2, trials = 5, prob = 0.5)

# to get the parameters of the binomial distribution and get the summary measures
bin_v <- bin_variable(trials = 10 ,prob = 0.3)
summary(bin_v)

# to calculate the probability distribution and visualize it
bin_d <- bin_distribution(trials = 5 ,prob = 0.5)
bin_d
plot(bin_d)

# to calculate the cumulative distribution and visualize it
bin_c <- bin_cumulative(trials = 5 ,prob = 0.5)
bin_c
plot(bin_c)

# to calculate the summary measures of the bonimial distrbution
bin_mean(trials = 10, prob = 0.3)      # to get mean
bin_variance(trials = 10, prob = 0.3)  # to get variance
bin_mode(trials = 10, prob = 0.3)      # to get mode
bin_skewness(trials = 10, prob = 0.3)  # to get skewness
bin_kurtosis(trials = 10, prob = 0.3)  # to get kurtosis
```
