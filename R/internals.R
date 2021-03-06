
## Internal functions (not exported)

assert_reporting <- function(x) {
  if (!is.numeric(x)) stop("reporting is not numeric")
  if (!is.finite(x)) stop("reporting is not a finite value")
  if (x <= 0) stop("reporting <= 0")
  if (x > 1) stop("reporting > 1")
}





## A fix for the nonesensical behaviour of `sample` when first argument is of
## length 1.

sample_ <- function(x, ...) {
  x[sample.int(length(x), ...)]
}





## Define colors for quantiles
quantile_pal <- grDevices::colorRampPalette(
  c("#b3c6ff", "#d147a3", "#993366"), bias = 2)

color_quantiles <- function(x, palette = quantile_pal) {
  labels <- as.character(unique(x))
  dist_from_median <- 50 - abs(50-as.numeric(sub("%", "", labels)))
  out <- palette(51)[dist_from_median + 1]
  names(out) <- labels
  out
}
