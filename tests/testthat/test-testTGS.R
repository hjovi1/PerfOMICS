test_that("TGS output is not greater than 100", {
  tgs <- calculateTGS()
  expect_lte(tgs,100)
})

test_that("TGS output is not less than 0", {
  tgs <- calculateTGS()
  expect_gte(tgs,0)
})

