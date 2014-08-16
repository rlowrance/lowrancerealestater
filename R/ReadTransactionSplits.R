ReadTransactionSplits <- function(path.in.base, split.names, nrow = 0, verbose = FALSE) {
    # return data.frame containing certain features for all transactions
#    split.names <- c( 'saleDate'  # dates are used to select testing and training data
#                     ,'recordingDate'
#                     ,'price'
#                     ,'log.price'
#                     ,'apn'
#                     ,Predictors('Chopra', form = 'log', center = TRUE, useAssessment = TRUE)
#                     ,Predictors('Chopra', form = 'log', center = FALSE, useAssessment = TRUE)
#                     ,Predictors('Chopra', form = 'level', center = TRUE, useAssessment = TRUE)
#                     ,Predictors('Chopra', form = 'level', center = FALSE, useAssessment = TRUE)
#                     ,Predictors('Chopra', form = 'log', center = TRUE, useAssessment = FALSE)
#                     ,Predictors('Chopra', form = 'log', center = FALSE, useAssessment = FALSE)
#                     ,Predictors('Chopra', form = 'level', center = TRUE, useAssessment = FALSE)
#                     ,Predictors('Chopra', form = 'level', center = FALSE, useAssessment = FALSE)
#                     )
#    split.names.unique <- unique(split.names)

    # append each split as a column onto a large data frame
    data <- NULL 
    for (split.name in split.names) {
        new.column <- ReadSplit( path.in = path.in.base
                                ,split.name = split.name
                                ,nrow = nrow
                                ,verbose = verbose
                                )
        if (verbose) cat('new.column', split.name, '\n')
        data <- if(is.null(data)) new.column else cbind(data, new.column)
    }

    data
}
