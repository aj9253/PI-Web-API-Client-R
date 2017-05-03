piItemsAttribute <- function(items = NULL, links = NULL) {
	if (is.null(items) == FALSE) {
		if (is.list(items) == FALSE) {
			return (print(paste0("Error: items must be a list.")))
		}
	}
	if (is.null(links) == FALSE) {
	}
	value <- list(
	Items = items,
	Links = links)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piItemsAttribute"
	return(valueCleaned)
}
