piTableData <- function(columns = NULL, rows = NULL) {
	if (is.null(columns) == FALSE) {
	}
	if (is.null(rows) == FALSE) {
		if (is.list(rows) == FALSE) {
			return (print(paste0("Error: rows must be a list.")))
		}
	}
	value <- list(
	Columns = columns,
	Rows = rows)
	valueCleaned <- rmNullObs(value)
	attr(valueCleaned, "className") <- "piTableData"
	return(valueCleaned)
}
