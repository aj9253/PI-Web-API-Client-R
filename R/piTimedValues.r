piTimedValues <- function(items = NULL, unitsAbbreviation = NULL) {
	if (is.null(items) == FALSE) {
		if (is.list(items) == FALSE) {
			return (print(paste0("Error: items must be a list.")))
		}
	}
	if (is.null(unitsAbbreviation) == FALSE) {
		if (is.character(unitsAbbreviation) == FALSE) {
			return (print(paste0("Error: unitsAbbreviation must be a string.")))
		}
	}
	value <- list(
	Items = items,
	UnitsAbbreviation = unitsAbbreviation)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piTimedValues"
	return(valueCleaned)
}
