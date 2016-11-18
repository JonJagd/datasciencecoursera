pollutantmean <- function(directory, pollutant, id = 1:332){
        ## 'directory' is a character vector of length 1 indicating
        ## the loaction of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating 
        ## the name of the pollutant for wich we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        
        ## listen af filer i folderen læses
        myFiles <- list.files(directory, pattern = "*.csv") 
        ## vi laver en data frame til at samle alle dataene i en stor data frame
        bigtable <- data.frame(date = character(), sulfate = numeric(), nitrate = numeric(), ID = numeric()) 


        for(i in id){ 
                
                pmfile <- paste(directory, myFiles[i], sep="") ## nuværende filnavn defineres
                
                newtable <- read.csv(pmfile) ## filen indlæses i en tabel
                
                bigtable <- rbind(bigtable, newtable) # den nye tabel læses ind i en stor samlet tabel

        }
        
        meanvalue <- mean(bigtable[ , pollutant], na.rm = TRUE)
        print(meanvalue)
        
        ## Example output
        ## OK pollutantmean("Datafiles/specdata/", "sulfate", 1:10) - forventet resultat: 4.064
        ## OK pollutantmean("Datafiles/specdata/", "nitrate", 70:72) - forventet resultat: 1.706
        ## OK pollutantmean("Datafiles/specdata/", "nitrate", 23) - forventet resultat: 1.281
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
}