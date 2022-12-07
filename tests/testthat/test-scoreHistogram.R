test_that("Data input has correct number of columns", {
  ds <- system.file("extdata", "fake_dataset.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  c <- ncol(data)
  scoreHistogram(data)
  expect_equal(c, 25)
})
