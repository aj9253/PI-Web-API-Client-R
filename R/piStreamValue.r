piStreamValue <- function(webId = NULL, name = NULL, path = NULL, value = NULL, links = NULL) {
	if (is.null(webId) == FALSE) {
		if (is.character(webId) == FALSE) {
			return (print(paste0("Error: webId must be a string.")))
		}
	}
	if (is.null(name) == FALSE) {
		if (is.character(name) == FALSE) {
			return (print(paste0("Error: name must be a string.")))
		}
	}
	if (is.null(path) == FALSE) {
		if (is.character(path) == FALSE) {
			return (print(paste0("Error: path must be a string.")))
		}
	}
	if (is.null(value) == FALSE) {
		className <- attr(value, "className")
		if ((is.null(className)) || (className != "piTimedValue")) {
			return (print(paste0("Error: the class from the parameter value should be piTimedValue.")))
		}
	}
	if (is.null(links) == FALSE) {
	}
	value <- list(
	WebId = webId,
	Name = name,
	Path = path,
	Value = value,
	Links = links)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piStreamValue"
	return(valueCleaned)
}
