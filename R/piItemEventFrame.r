piItemEventFrame <- function(identifier = NULL, identifierType = NULL, object = NULL, exception = NULL) {
	if (is.null(identifier) == FALSE) {
		if (is.character(identifier) == FALSE) {
			return (print(paste0("Error: identifier must be a string.")))
		}
	}
	if (is.null(identifierType) == FALSE) {
		if (is.character(identifierType) == FALSE) {
			return (print(paste0("Error: identifierType must be a string.")))
		}
	}
	if (is.null(object) == FALSE) {
		className <- attr(object, "className")
		if ((is.null(className)) || (className != "piEventFrame")) {
			return (print(paste0("Error: the class from the parameter object should be piEventFrame.")))
		}
	}
	if (is.null(exception) == FALSE) {
		className <- attr(exception, "className")
		if ((is.null(className)) || (className != "piErrors")) {
			return (print(paste0("Error: the class from the parameter exception should be piErrors.")))
		}
	}
	value <- list(
	Identifier = identifier,
	IdentifierType = identifierType,
	Object = object,
	Exception = exception)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piItemEventFrame"
	return(valueCleaned)
}
