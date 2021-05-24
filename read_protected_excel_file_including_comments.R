# Get sheet information from password protected excel, including comments----

# install.packages("rlist")
# install.packages("xlsx")
# install.packages('dplyr')
library(rlist)
library(xlsx)
library(dplyr)

# Set directory folder
setwd("C:/Users/mfelix/Desktop/Manuel/trabalho")
# Name of the excel file
fileName="Folhas salarios_2011_12_part"
# Password of the excel file
passWord="testemaio21"
# File name with extension
fileNameFinal = paste(fileName,".xlsx",sep="")

# Get name of sheets
aaa <- getSheets(loadWorkbook(file=fileNameFinal,password=passWord))
names <- as.data.frame(list.names(aaa))

# Function like rbind.fill from purrr but for columns----
cbind.fill<-function(...){
  nm <- list(...) 
  nm<-lapply(nm, as.matrix)
  n <- max(sapply(nm, nrow)) 
  do.call(cbind, lapply(nm, function (x) 
    rbind(x, matrix(data=NA, n-nrow(x), ncol(x))))) 
}

# Iterate through nº of sheets----
for (k in (1:8)){

  # Deal with comments
  
  sheets <- getSheets(loadWorkbook(file=fileNameFinal,password=passWord))
  sheet <- sheets[[k]]
  rows <- getRows(sheet)
  cells <- getCells(rows)
  
  comments <- lapply(cells, getCellComment)
  
  read_comments <- comments %>% 
    purrr::discard(is.null)
  
  resp <- vector('list')
  
  for (i in seq_along(read_comments)) {
    
    resp[[i]] <- read_comments[[i]]$getString()
  }

comp <- 1
while(comp <= length(resp)){
  a <- resp[[comp]]$toString()
  if(exists("commentDF")){
    commentDF <- rbind(commentDF,a)
  }else{commentDF=a}
  comp=comp+1
}
commentDF <- as.data.frame(commentDF)

# Get information from sheets----

# colIndex: Defines the range of columns by its index. If left blank, import all columns
# startRow (index) as header. endRow not included (index of startRow <= choose lines < index of endRow)
df <- xlsx::read.xlsx(file=fileNameFinal, sheetIndex=k,
                      header=FALSE,password=passWord,colIndex=c(1:9), encoding="UTF-8")

# Remove every row before the table we want
headerRow<- match("Recibo Branco",df[ ,1])
if(headerRow!=1){
df <- df[-(1:(headerRow-1)), , drop = FALSE]
}
df <- cbind(df,names[k,])

df <- as.data.frame(cbind.fill(df,names[k,],commentDF))

# Put the info of every sheet in the same data frame

if(exists("dfFinal")){
  dfFinal <- plyr::rbind.fill(dfFinal,df)
}else{dfFinal=df}

}