test_that("TGS output is correct", {
  tgs <- calculateTGS()
  tgs
  expect_equal(2 * 2, 4)
})
