test_that("Handles invalid formatted input", {
  ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  data = data[-1,]
  expect_error(userScore(data))
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

  expect_type(userScore(data), "double")
})

test_that("Results are of expected rage", {
  ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)

  expect_lte(userScore(data), 100)
  expect_gte(userScore(data), 0)
})
