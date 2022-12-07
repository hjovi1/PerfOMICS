test_that("Handles invalid formatted input", {
  ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  data = data[-1,]
  expect_error(userScore(data))
})

test_that("Data input has correct number of rows and columns", {
  ds <- system.file("extdata", "Ind2.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  c <- ncol(data)
  r <- nrow(data)
  expect_equal(c, 2)
  expect_equal(r, 23)
})

