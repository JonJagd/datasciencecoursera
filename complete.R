complete <- function(directory, id = 1:332){
        ## 'directory' is the a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the 
        ## number of complete cases
        
        ## Testparameters
        ##directory <- "Datafiles/specdata/"
        ##i <- 1
        
        
        ## listen af filer i folderen læses
        myFiles <- list.files(directory, pattern = "*.csv") 
        ## vi laver en data frame til at samle alle dataene i en stor data frame
        bigtable <- data.frame(id = numeric(), nobs = numeric()) 
        
        
        
        for (i in id){
                
                nexttable <- read.csv(paste(directory, myFiles[i], sep="")) ## filen indlæses i en tabel
                
                bigtable <- rbind(bigtable, data.frame(id = i, nobs = sum(complete.cases(nexttable)))) # den nye tabel læses ind i en stor samlet tabel
        }
        
        return(bigtable)
        
}