# 'Facebook posts' v1.0 node for IBM SPSS Modeler
# Based on the package 'Rfacebook' created by Pablo Barbera available on http://cran.r-project.org/web/packages/Rfacebook/
# Denis Lecoeuche - IBM Extreme Blue 2014
# Jonathan Langefeld - IBM 2016
# Description: Get posts from a public facebook page directly in SPSS Modeler with this easy-to-use node.
# This is not a proper 'source' node: please read the documentation to know how to use it.
# Installing and/or loading the required R packages.
packages <- function(x) {
  x <- as.character(match.call()[[2]])
  if (!require(x,character.only=TRUE)){
    install.packages(pkgs=x,repos="http://cran.r-project.org")
    require(x,character.only=TRUE)
  }
}
packages(Rfacebook)
# Getting user specified values
fb_oauth <- "%%authkey%%"
page <- "%%page%%"
number_of_posts <- %%numberOfPosts%%
feed_tf <- %%feed%%
# Deleting spaces and unwanted characters in the pageID
page <- iconv(page, to='ASCII//TRANSLIT') #removing accented characters
page <- gsub(" ","",page) # removing spaces
print(paste("Page ID : ", page))
# Getting the posts and information
modelerData <- getPage(page=page, token = fb_oauth, n = number_of_posts, feed = feed_tf)

# Creating the dataframe for the metadata (required by SPSS Modeler)
var1 <- c(fieldName="UserID", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var2 <- c(fieldName="Name", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var3 <- c(fieldName="Post", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var4 <- c(fieldName="CreatedTime", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var5 <- c(fieldName="Type", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var6 <- c(fieldName="Link", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var7 <- c(fieldName="PostID", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var8 <- c(fieldName="LikesCount", fieldLabel="", fieldStorage="integer", fieldMeasure="", fieldFormat="", fieldRole="")
var9 <- c(fieldName="CommentsCount", fieldLabel="", fieldStorage="integer", fieldMeasure="", fieldFormat="", fieldRole="")
var10 <- c(fieldName="SharesCount", fieldLabel="", fieldStorage="integer", fieldMeasure="", fieldFormat="", fieldRole="")
modelerDataModel <- data.frame(var1,var2,var3,var4,var5,var6,var7,var8,var9,var10)
if (dim(modelerData)[2] != 10) {
  warning("The loading process failed. Please verify your access token and the Page ID you specified.")
}
