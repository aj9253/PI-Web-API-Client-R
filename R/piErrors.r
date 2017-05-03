piErrors <- function(errors = NULL) {
	if (is.null(errors) == FALSE) {
		if (is.list(errors) == FALSE) {
			return (print(paste0("Error: errors must be a list.")))
		}
		if (is.character(errors[[1]]) == FALSE) {
			return (print(paste0("Error: errors[[1]] must be a string.")))
		}
	}
	value <- list(
	Errors = errors)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piErrors"
	return(valueCleaned)
}
