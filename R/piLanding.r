piLanding <- function(links = NULL) {
	if (is.null(links) == FALSE) {
	}
	value <- list(
	Links = links)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piLanding"
	return(valueCleaned)
}
