# 'Facebook reactions' v1.0 node for IBM SPSS Modeler
# Based on the package 'Rfacebook' created by Pablo Barbera available on http://cran.r-project.org/web/packages/Rfacebook/
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
token <- "%%token%%"
posts <- modelerData$%%posts%%

# Load reactions from Facebook Graph API
reactions = getReactions(post=posts, token=token, verbose = FALSE)
reactions$id = NULL

# Add new fields to Stream
modelerData <- cbind(modelerData, reactions)
var1<-c(fieldName="likes_count",fieldLabel="",fieldStorage="integer",fieldMeasure="",fieldFormat="",fieldRole="")
var2<-c(fieldName="love_count",fieldLabel="",fieldStorage="integer",fieldMeasure="",fieldFormat="",fieldRole="")
var3<-c(fieldName="haha_count",fieldLabel="",fieldStorage="integer",fieldMeasure="",fieldFormat="",fieldRole="")
var4<-c(fieldName="wow_count",fieldLabel="",fieldStorage="integer",fieldMeasure="",fieldFormat="",fieldRole="")
var5<-c(fieldName="sad_count",fieldLabel="",fieldStorage="integer",fieldMeasure="",fieldFormat="",fieldRole="")
var6<-c(fieldName="angry_count",fieldLabel="",fieldStorage="integer",fieldMeasure="",fieldFormat="",fieldRole="")
modelerDataModel <- data.frame(modelerDataModel, var1,var2,var3,var4,var5,var6)
