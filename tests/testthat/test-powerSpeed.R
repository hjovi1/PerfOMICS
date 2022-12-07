test_that("Range of number of matches is correct", {
  ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  expect_lte(length(powerSpeed(data)), 4)
  expect_gte(length(powerSpeed(data)), 0)
})

test_that("Dataframe has correct number of rows and columns", {
  ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  c <- ncol(data)
  r <- nrow(data)
  expect_equal(c, 2)
  expect_equal(r, 23)
})

test_that("Results are of expected type", {
  ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)

  expect_type(powerSpeed(data), "list")
})
