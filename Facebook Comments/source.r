# 'Facebook Comments' v1.0 node for IBM SPSS Modeler
# Based on the package 'Rfacebook' created by Pablo Barbera available on http://cran.r-project.org/web/packages/Rfacebook/
# Denis Lecoeuche - IBM Extreme Blue 2014
# Description: Get comments from a public post directly into SPSS Modeler with this easy-to-use node.
# NB: This is not a proper 'source' node: please read the documentation to know how to use it.

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
post_id <- "%%postID%%"
number_of_comments <- %%numberOfComments%%

# Getting the comments and information about it
modelerData <- getPost(post=post_id, token = fb_oauth, n = number_of_comments, comments=TRUE, likes=FALSE)
modelerData <- modelerData[[2]]

# Creating the dataframe for the metadata (required by SPSS Modeler)
var1 <- c(fieldName="UserID", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var2 <- c(fieldName="Name", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var3 <- c(fieldName="Comment", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var4 <- c(fieldName="CreatedTime", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var5 <- c(fieldName="LikesCount", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")
var6 <- c(fieldName="CommentID", fieldLabel="", fieldStorage="string", fieldMeasure="", fieldFormat="", fieldRole="")

modelerDataModel <- data.frame(var1,var2,var3,var4,var5,var6)

if (dim(modelerData)[2] != 6) {
   warning("The loading process failed. Please verify your access token, the post_ID you specified.")
}

Post ID
Number of comments desired
