piSecurityMapping <- function(webId = NULL, id = NULL, name = NULL, description = NULL, path = NULL, account = NULL, securityIdentityWebId = NULL, links = NULL) {
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
	if (is.null(path) == FALSE) {
		if (is.character(path) == FALSE) {
			return (print(paste0("Error: path must be a string.")))
		}
	}
	if (is.null(account) == FALSE) {
		if (is.character(account) == FALSE) {
			return (print(paste0("Error: account must be a string.")))
		}
	}
	if (is.null(securityIdentityWebId) == FALSE) {
		if (is.character(securityIdentityWebId) == FALSE) {
			return (print(paste0("Error: securityIdentityWebId must be a string.")))
		}
	}
	if (is.null(links) == FALSE) {
	}
	value <- list(
	WebId = webId,
	Id = id,
	Name = name,
	Description = description,
	Path = path,
	Account = account,
	SecurityIdentityWebId = securityIdentityWebId,
	Links = links)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piSecurityMapping"
	return(valueCleaned)
}
