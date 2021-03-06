piSummaryValue <- function(type = NULL, value = NULL) {
	if (is.null(type) == FALSE) {
		if (is.character(type) == FALSE) {
			return (print(paste0("Error: type must be a string.")))
		}
	}
	if (is.null(value) == FALSE) {
		className <- attr(value, "className")
		if ((is.null(className)) || (className != "piTimedValue")) {
			return (print(paste0("Error: the class from the parameter value should be piTimedValue.")))
		}
	}
	value <- list(
	Type = type,
	Value = value)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piSummaryValue"
	return(valueCleaned)
}
