corr <- function(directory, threshold = 0) {
        ## 'directory' is the a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Testparameters
        #directory <- "Datafiles/specdata/"
        #threshold <- 150
        #id <- 2

        ## vha complete()-funktionen laver jeg en data frame med id og antal complete cases per fil 
        ## og subsetter til dem der har antal complete cases > threshold
        abovethreshold <- subset(data.frame(complete(directory)), nobs > threshold) ## skal effektiviseres så jeg kun tager de relevante 
        
        
        ## Funktionen læser data fra filen id og foretager en correlationsberegning på kolonne 2 og 3
        cr <- function(id){
                path <- file.path(directory, paste(sprintf("%03d", as.numeric(id)), ".csv", sep=""))
                nextfile <- data.frame(read.csv(path))
                retval <- (cor(nextfile[, 2], nextfile[, 3], use = "complete.obs"))
                return(retval)
        }
        
        ##return (unlist(data.frame(cr=sapply(unlist(abovethreshold[1], use.names = FALSE), cr)), use.names = FALSE))
        return (unlist(data.frame(cr=sapply(abovethreshold$id, cr)), use.names = FALSE))
        
        ## Return a numeric vector of correlations
        
}