test_that("Handles invalid formatted input", {
  expect_error(generateDataset("a"))
})

test_that("Dataframe has correct number of rows and columns", {
  d <- generateDataset(10)
  c <- ncol(d)
  r <- nrow(d)
  expect_equal(c, 25)
  expect_equal(r, 10)
})
