context('check for summary measures')

test_that('aux_mean() works as expected',{
  expect_length(aux_mean(10,0.3),1)
  expect_equal(aux_mean(10,0.3),3)
  expect_type(aux_mean(10,0.3),'double')
})

test_that('aux_variance() works as expected',{
  expect_length(aux_variance(10,0.3),1)
  expect_equal(aux_variance(10,0.3),2.1)
  expect_type(aux_variance(10,0.3),'double')
})

test_that('aux_mode() works as expected',{
  expect_length(aux_mode(3,0.5),2)
  expect_length(aux_mode(10,0.3),1)
  expect_equal(aux_mode(10,0.3),3)
  expect_type(aux_mode(10,0.3),'integer')
})

test_that('aux_skewness() works as expected',{
  expect_length(aux_skewness(10,0.3),1)
  expect_equal(aux_skewness(10,0.3),(1-2*0.3)/sqrt(10*0.3*(1-0.3)))
  expect_type(aux_skewness(10,0.3),'double')
})

test_that('aux_kurtosis() works as expected',{
  expect_length(aux_kurtosis(10,0.3),1)
  expect_equal(aux_kurtosis(10,0.3),(1-6*0.3*(1-0.3))/(10*0.3*(1-0.3)))
  expect_type(aux_kurtosis(10,0.3),'double')
})
