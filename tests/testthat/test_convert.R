library(convertR)
context("Conversions")

test_that("Conversions are computed correctly", {
  expect_equal(convert(1000, 'g', 'kg'), 1)
  expect_equal(convert(1, 'kg', 'g'), 1000)
  expect_equal(convert(1, 'd', 'ms'), 60*60*24*1000)
  expect_equal(convert(1000, 'g', 'st'), 0.157473, tolerance=1e-3)
  expect_equal(convert(1, 'kWh', 'therm'), 0.03413, tolerance=1e-3)
})
