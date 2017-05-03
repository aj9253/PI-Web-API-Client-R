batchApi <- R6Class("batchApi",
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
		execute = function(batch) {
			queryParameters <- list()
			if (is.null(batch) || batch == "") {
				return (paste0("Error: required parameter batch was null or undefined"))
			}
			localVarPath <- paste(c(self$serviceBase, '/batch'), collapse = "")
			res <- postHttpRequest(localVarPath, batch, self$username, self$password, self$authType, self$debug)
			return (res)
		}
	)
)
