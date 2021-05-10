# Read files in order to identify what was created temporarily
content_tmp_testfolder <- fs::dir_ls(testthat::test_path())

# -------------------------------------------------------------------------

# Remove files that didn't exist earlier
content_tmp_testfolder[!content_tmp_testfolder %in% content_testfolder ] %>%
  unlink(., recursive = TRUE)
