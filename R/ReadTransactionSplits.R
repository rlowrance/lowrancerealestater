ReadTransactionSplits <- function(path.in.base, split.names, verbose = FALSE) {
    # return data.frame containing specified features for all transactions

    # append each split as a column onto a large data frame
    data <- NULL 
    for (split.name in split.names) {
        new.column <- ReadSplit( path.in = path.in.base
                                ,split.name = split.name
                                ,verbose = verbose
                                )
        if (verbose) cat('new.column', split.name, '\n')
        data <- if(is.null(data)) new.column else cbind(data, new.column)
    }

    data
}
