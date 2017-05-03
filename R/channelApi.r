channelApi <- R6Class("channelApi",
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
		instances = function() {
			queryParameters <- list()
			localVarPath <- paste(c(self$serviceBase, '/channels/instances'), collapse = "")
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
			}
			return (contentResponse)
		}
	)
)
