test_that("Gene input exists in dataframe", {
  ds <- system.file("extdata", "fake_dataset.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  expect_error(genotypeScatter(data, data$BRCA1))

})

test_that("Data input has correct number of columns", {
  ds <- system.file("extdata", "fake_dataset.xlsx", package = "PerfOMICS")
  data <- readxl::read_excel(ds)
  c <- ncol(data)
  genotypeScatter(data,data$ACE)
  expect_equal(c, 25)
})
