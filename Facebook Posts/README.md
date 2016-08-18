### 'Facebook Posts' Node for IBM SPSS Modeler – Step by Step Tutorial

_Import Facebook posts from a public page directly in SPPS Modeler with this easy-to-use node._

#### Description:
This SPSS Modeler ‘source’ node allows you to import Facebook posts from a page easily. Simply install the node, paste your authentication key and choose the page and number of posts you would like to import. Afterwards you can start doing text analysis on social data and get insights for your business.

#### Requirements:
* R v2.15.2 (does not matter on Mac OS)
* SPSS Modeler v16.0 or later
* SPSS Modeler ‘R essentials’ plugin

### Installation:
In SPSS Modeler Click on '**Extensions**' --> '**Install Local Extenstions Bundle...**' and navigate to the [FacebookPosts.mpe](FacebookPosts.mpe) file in this folder.  
**_or..._**  
In SPSS Modeler Click on '**Extensions**' --> '**Extensions Hub...**', search, '**Facebook Posts**' and click '**Install...**'.

---

You can start with the stream ['**FacebookPosts_ExampleStream.str**'](FacebookPosts_ExampleStream.str) provided in this folder.

###### 1\.  
In SPSS Modeler v18.0 it is not possible to create proper ‘source’ nodes with R code. However it is made possible if you trick the software a bit: you just have to put a user input with fake fields before the Facebook node in order to start the stream. In this example we put a user input with: Field a ; Storage String ; Values “a” (see the screenshot below).
<center><img src="img/1.png" width=80% /></center><br>

###### 2\.  
Double click on the ‘Facebook Posts’ node.
<center><img src="img/2.png" style="max-width:80%"/></center><br>
Now fill the fields:
* ‘Page ID’. You can find the Page ID on the URL of the page you would like to get posts from. http://facebook.com/This_is_the_Page_ID
* ‘Number of posts desired’. The number you specify is the maximum number of posts returned.
* Check or uncheck ‘Include non-admin posts’. You can choose to load only the posts published by the owner of the page or to include the posts published on the page by average users.
* ‘Access Token’. To access data from Facebook you need to have an authentication key that enables you the access via the API. You can easily get temporary (2 hours) or permanent access tokens; please read the [‘How to get a Facebook access token’](https://github.com/jonnyenglish/SPSSFacebook#how-to-get-a-facebook-access-token--step-by-step-tutorial) tutorial.

###### 3\.
Add an output node after the ‘Facebook Posts’ node, in order to visualize the data you gathered. For example you can start with a ‘Table’.
Click on the table and run the stream (see below).  
<center><img src="img/3.png" style="max-width:80%" /></center><br>
Here is what we obtain:
<p align="center">
  <img src="img/4.png"/ style="max-width:40%" width=80%>
</p>

###### 4\.
Now, it’s your turn to gather social data directly into SPSS and start text mining customer opinions.
<p align="center">
  <img src="img/5.png"/ style="max-width:40%" width=40%>
</p>
