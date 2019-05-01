context('check for checkers')

test_that("check_prob() works as expected",{
  expect_error(check_prob(2))
  expect_error(check_prob(c(0.5,0.3)))
  expect_error(check_prob('a'))
  expect_error(check_prob(TRUE))
})

test_that("check_trials() works as expected",{
  expect_error(check_trials(-2))
  expect_error(check_trials(c(1,2)))
  expect_error(check_trials('a'))
  expect_error(check_trials(TRUE))
})

test_that("check_success() works as expected",{
  expect_error(check_success(success = c(-2,2),trials = 5))
  expect_error(check_success(success = c(5,4),trials = 3))
  expect_error(check_success(success = c(0.3,0.4),trials = 3))
})




