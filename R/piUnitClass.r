piUnitClass <- function(webId = NULL, id = NULL, name = NULL, description = NULL, canonicalUnitName = NULL, canonicalUnitAbbreviation = NULL, path = NULL, links = NULL) {
	if (is.null(webId) == FALSE) {
		if (is.character(webId) == FALSE) {
			return (print(paste0("Error: webId must be a string.")))
		}
	}
	if (is.null(id) == FALSE) {
		if (is.character(id) == FALSE) {
			return (print(paste0("Error: id must be a string.")))
		}
	}
	if (is.null(name) == FALSE) {
		if (is.character(name) == FALSE) {
			return (print(paste0("Error: name must be a string.")))
		}
	}
	if (is.null(description) == FALSE) {
		if (is.character(description) == FALSE) {
			return (print(paste0("Error: description must be a string.")))
		}
	}
	if (is.null(canonicalUnitName) == FALSE) {
		if (is.character(canonicalUnitName) == FALSE) {
			return (print(paste0("Error: canonicalUnitName must be a string.")))
		}
	}
	if (is.null(canonicalUnitAbbreviation) == FALSE) {
		if (is.character(canonicalUnitAbbreviation) == FALSE) {
			return (print(paste0("Error: canonicalUnitAbbreviation must be a string.")))
		}
	}
	if (is.null(path) == FALSE) {
		if (is.character(path) == FALSE) {
			return (print(paste0("Error: path must be a string.")))
		}
	}
	if (is.null(links) == FALSE) {
	}
	value <- list(
	WebId = webId,
	Id = id,
	Name = name,
	Description = description,
	CanonicalUnitName = canonicalUnitName,
	CanonicalUnitAbbreviation = canonicalUnitAbbreviation,
	Path = path,
	Links = links)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piUnitClass"
	return(valueCleaned)
}
