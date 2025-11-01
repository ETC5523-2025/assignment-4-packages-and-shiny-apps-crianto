#' Top 1000 US Names Dataset
#'
#' A dataset containing the 1000 most common surnames in the United States,
#' along with demographic breakdowns from the U.S. Census.
#'
#' @format A tibble with 1000 rows and 11 variables:
#' \describe{
#'   \item{name}{Surname (character)}
#'   \item{rank}{Ranking by frequency (numeric)}
#'   \item{count}{Number of occurrences (numeric)}
#'   \item{prop100k}{Proportion per 100,000 people (numeric)}
#'   \item{cum_prop100k}{Cumulative proportion per 100,000 (numeric)}
#'   \item{pct_white}{Percent White (numeric)}
#'   \item{pct_black}{Percent Black (numeric)}
#'   \item{pct_api}{Percent Asian/Pacific Islander (numeric)}
#'   \item{pct_aian}{Percent American Indian/Alaska Native (numeric)}
#'   \item{pct_two_or_more}{Percent two or more races (numeric)}
#'   \item{pct_hispanic}{Percent Hispanic (numeric)}
#' }
#'
#' @source U.S. Census Bureau, 2010 Census.
"Top1000"
