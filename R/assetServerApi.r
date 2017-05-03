assetServerApi <- R6Class("assetServerApi",
	private = list(),
	public = list(
		serviceBase = NULL,
		authType = NULL,
		username = NULL,
		password = NULL,
		debug = NULL,
		initialize = function(baseUrl, authType, username, password, debug) {
			self$serviceBase <- baseUrl
			self$username <- username
			self$password <- password
			self$authType <- authType
			self$debug <- debug
		},
		list = function(selectedFields) {
			queryParameters <- list()
			localVarPath <- paste(c(self$serviceBase, '/assetservers'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsAssetServer"
			}
			return (contentResponse)
		},
		getByName = function(name, selectedFields) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			queryParameters$name <- name
			localVarPath <- paste(c(self$serviceBase, '/assetservers#name'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piAssetServer"
			}
			return (contentResponse)
		},
		getByPath = function(path, selectedFields) {
			queryParameters <- list()
			if (is.null(path) || path == "") {
				return (paste0("Error: required parameter path was null or undefined"))
			}
			if (is.character(path) == FALSE) {
				return (print(paste0("Error: path must be a string.")))
			}
			queryParameters$path <- path
			localVarPath <- paste(c(self$serviceBase, '/assetservers#path'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piAssetServer"
			}
			return (contentResponse)
		},
		get = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piAssetServer"
			}
			return (contentResponse)
		},
		getAnalysisRulePlugIns = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/analysisruleplugins'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsAnalysisRulePlugIn"
			}
			return (contentResponse)
		},
		getDatabases = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/assetdatabases'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsAssetDatabase"
			}
			return (contentResponse)
		},
		createAssetDatabase = function(webId, database) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(database) || database == "") {
				return (paste0("Error: required parameter database was null or undefined"))
			}
			className <- attr(database, "className")
			if ((is.null(className)) || (className != "piAssetDatabase")) {
				return (print(paste0("Error: the class from the parameter database should be piAssetDatabase.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/assetdatabases'), collapse = "")
			res <- postHttpRequest(localVarPath, database, self$username, self$password, self$authType, self$debug)
			return (res)
		},
		getSecurity = function(webId, securityItem, userIdentity, forceRefresh, selectedFields) {
			queryParameters <- generateListForTwoQueryString(securityItem, "securityItem", userIdentity, "userIdentity")
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(securityItem) || securityItem == "") {
				return (paste0("Error: required parameter securityItem was null or undefined"))
			}
			if (is.list(securityItem) == FALSE) {
				return (print(paste0("Error: securityItem must be a list.")))
			}
			if (is.null(userIdentity) || userIdentity == "") {
				return (paste0("Error: required parameter userIdentity was null or undefined"))
			}
			if (is.list(userIdentity) == FALSE) {
				return (print(paste0("Error: userIdentity must be a list.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/security'), collapse = "")
			if (missing(forceRefresh) == FALSE && is.null(forceRefresh) == FALSE && forceRefresh != "") {
				queryParameters$forceRefresh <- forceRefresh
				if (is.logical(forceRefresh) == FALSE) {
					return (print(paste0("Error: forceRefresh must be a boolean.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsSecurityRights"
			}
			if (res$status == 400) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 401) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 409) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 502) {
				attr(contentResponse, "className") <- "piErrors"
			}
			return (contentResponse)
		},
		getSecurityEntries = function(webId, nameFilter, securityItem, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityentries'), collapse = "")
			if (missing(nameFilter) == FALSE && is.null(nameFilter) == FALSE && nameFilter != "") {
				queryParameters$nameFilter <- nameFilter
				if (is.character(nameFilter) == FALSE) {
					return (print(paste0("Error: nameFilter must be a string.")))
				}
			}
			if (missing(securityItem) == FALSE && is.null(securityItem) == FALSE && securityItem != "") {
				queryParameters$securityItem <- securityItem
				if (is.character(securityItem) == FALSE) {
					return (print(paste0("Error: securityItem must be a string.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsSecurityEntry"
			}
			return (contentResponse)
		},
		createSecurityEntry = function(webId, securityEntry, applyToChildren, securityItem) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(securityEntry) || securityEntry == "") {
				return (paste0("Error: required parameter securityEntry was null or undefined"))
			}
			className <- attr(securityEntry, "className")
			if ((is.null(className)) || (className != "piSecurityEntry")) {
				return (print(paste0("Error: the class from the parameter securityEntry should be piSecurityEntry.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityentries'), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			if (missing(securityItem) == FALSE && is.null(securityItem) == FALSE && securityItem != "") {
				queryParameters$securityItem <- securityItem
				if (is.character(securityItem) == FALSE) {
					return (print(paste0("Error: securityItem must be a string.")))
				}
			}
			res <- postHttpRequest(localVarPath, securityEntry, self$username, self$password, self$authType, self$debug)
			return (res)
		},
		getSecurityEntryByName = function(name, webId, securityItem, selectedFields) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityentries/', name), collapse = "")
			if (missing(securityItem) == FALSE && is.null(securityItem) == FALSE && securityItem != "") {
				queryParameters$securityItem <- securityItem
				if (is.character(securityItem) == FALSE) {
					return (print(paste0("Error: securityItem must be a string.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piSecurityEntry"
			}
			if (res$status == 404) {
				attr(contentResponse, "className") <- "piErrors"
			}
			return (contentResponse)
		},
		updateSecurityEntry = function(name, webId, securityEntry, applyToChildren, securityItem) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(securityEntry) || securityEntry == "") {
				return (paste0("Error: required parameter securityEntry was null or undefined"))
			}
			className <- attr(securityEntry, "className")
			if ((is.null(className)) || (className != "piSecurityEntry")) {
				return (print(paste0("Error: the class from the parameter securityEntry should be piSecurityEntry.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityentries/', name), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			if (missing(securityItem) == FALSE && is.null(securityItem) == FALSE && securityItem != "") {
				queryParameters$securityItem <- securityItem
				if (is.character(securityItem) == FALSE) {
					return (print(paste0("Error: securityItem must be a string.")))
				}
			}
			res <- putHttpRequest(localVarPath, securityEntry, self$username, self$password, self$authType, self$debug)
			return (res)
		},
		deleteSecurityEntry = function(name, webId, applyToChildren, securityItem) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityentries/', name), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			if (missing(securityItem) == FALSE && is.null(securityItem) == FALSE && securityItem != "") {
				queryParameters$securityItem <- securityItem
				if (is.character(securityItem) == FALSE) {
					return (print(paste0("Error: securityItem must be a string.")))
				}
			}
			res <- deleteHttpRequest(localVarPath, self$username, self$password, self$authType, self$debug)
			return (res)
		},
		getSecurityIdentities = function(webId, field, maxCount, query, selectedFields, sortField, sortOrder) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityidentities'), collapse = "")
			if (missing(field) == FALSE && is.null(field) == FALSE && field != "") {
				queryParameters$field <- field
				if (is.character(field) == FALSE) {
					return (print(paste0("Error: field must be a string.")))
				}
			}
			if (missing(maxCount) == FALSE && is.null(maxCount) == FALSE && maxCount != "") {
				queryParameters$maxCount <- maxCount
				if (check.integer(maxCount) == FALSE) {
					return (print(paste0("Error: maxCount must be an integer.")))
				}
			}
			if (missing(query) == FALSE && is.null(query) == FALSE && query != "") {
				queryParameters$query <- query
				if (is.character(query) == FALSE) {
					return (print(paste0("Error: query must be a string.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			if (missing(sortField) == FALSE && is.null(sortField) == FALSE && sortField != "") {
				queryParameters$sortField <- sortField
				if (is.character(sortField) == FALSE) {
					return (print(paste0("Error: sortField must be a string.")))
				}
			}
			if (missing(sortOrder) == FALSE && is.null(sortOrder) == FALSE && sortOrder != "") {
				queryParameters$sortOrder <- sortOrder
				if (is.character(sortOrder) == FALSE) {
					return (print(paste0("Error: sortOrder must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsSecurityIdentity"
			}
			return (contentResponse)
		},
		createSecurityIdentity = function(webId, securityIdentity) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(securityIdentity) || securityIdentity == "") {
				return (paste0("Error: required parameter securityIdentity was null or undefined"))
			}
			className <- attr(securityIdentity, "className")
			if ((is.null(className)) || (className != "piSecurityIdentity")) {
				return (print(paste0("Error: the class from the parameter securityIdentity should be piSecurityIdentity.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityidentities'), collapse = "")
			res <- postHttpRequest(localVarPath, securityIdentity, self$username, self$password, self$authType, self$debug)
			return (res)
		},
		getSecurityIdentitiesForUser = function(webId, userIdentity, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(userIdentity) || userIdentity == "") {
				return (paste0("Error: required parameter userIdentity was null or undefined"))
			}
			if (is.character(userIdentity) == FALSE) {
				return (print(paste0("Error: userIdentity must be a string.")))
			}
			queryParameters$userIdentity <- userIdentity
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securityidentities#userIdentity'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsSecurityIdentity"
			}
			if (res$status == 400) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 401) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 502) {
				attr(contentResponse, "className") <- "piErrors"
			}
			return (contentResponse)
		},
		getSecurityMappings = function(webId, field, maxCount, query, selectedFields, sortField, sortOrder) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securitymappings'), collapse = "")
			if (missing(field) == FALSE && is.null(field) == FALSE && field != "") {
				queryParameters$field <- field
				if (is.character(field) == FALSE) {
					return (print(paste0("Error: field must be a string.")))
				}
			}
			if (missing(maxCount) == FALSE && is.null(maxCount) == FALSE && maxCount != "") {
				queryParameters$maxCount <- maxCount
				if (check.integer(maxCount) == FALSE) {
					return (print(paste0("Error: maxCount must be an integer.")))
				}
			}
			if (missing(query) == FALSE && is.null(query) == FALSE && query != "") {
				queryParameters$query <- query
				if (is.character(query) == FALSE) {
					return (print(paste0("Error: query must be a string.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			if (missing(sortField) == FALSE && is.null(sortField) == FALSE && sortField != "") {
				queryParameters$sortField <- sortField
				if (is.character(sortField) == FALSE) {
					return (print(paste0("Error: sortField must be a string.")))
				}
			}
			if (missing(sortOrder) == FALSE && is.null(sortOrder) == FALSE && sortOrder != "") {
				queryParameters$sortOrder <- sortOrder
				if (is.character(sortOrder) == FALSE) {
					return (print(paste0("Error: sortOrder must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsSecurityMapping"
			}
			return (contentResponse)
		},
		createSecurityMapping = function(webId, securityMapping) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(securityMapping) || securityMapping == "") {
				return (paste0("Error: required parameter securityMapping was null or undefined"))
			}
			className <- attr(securityMapping, "className")
			if ((is.null(className)) || (className != "piSecurityMapping")) {
				return (print(paste0("Error: the class from the parameter securityMapping should be piSecurityMapping.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/securitymappings'), collapse = "")
			res <- postHttpRequest(localVarPath, securityMapping, self$username, self$password, self$authType, self$debug)
			return (res)
		},
		getTimeRulePlugIns = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/timeruleplugins'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsTimeRulePlugIn"
			}
			return (contentResponse)
		},
		getUnitClasses = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/unitclasses'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsUnitClass"
			}
			return (contentResponse)
		},
		createUnitClass = function(webId, unitClass) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(unitClass) || unitClass == "") {
				return (paste0("Error: required parameter unitClass was null or undefined"))
			}
			className <- attr(unitClass, "className")
			if ((is.null(className)) || (className != "piUnitClass")) {
				return (print(paste0("Error: the class from the parameter unitClass should be piUnitClass.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/assetservers/', webId, '/unitclasses'), collapse = "")
			res <- postHttpRequest(localVarPath, unitClass, self$username, self$password, self$authType, self$debug)
			return (res)
		}
	)
)
