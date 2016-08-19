### 'Facebook Comments' Node for IBM SPSS Modeler – Step by Step Tutorial

_Import Facebook comments from a public post directly in SPPS Modeler with this easy-to-use node._
<p align="center">
  <img src="img/Node.png"/ width=100px>
</p>

#### Description:
This SPSS Modeler ‘source’ node allows you to import Facebook comments from a post easily. Simply install the node, paste your authentication key and choose the post and number of comments you would like to import. Afterwards you can start doing text analysis on social data and get insights for your business.

---

You can start with the stream ['**FacebookPosts_ExampleStream.str**'](../ExampleStream.str) provided in this repository.

###### 1\.  
In SPSS Modeler v18.0 it is not possible to create proper ‘source’ nodes with R code. However it is made possible if you trick the software a bit: you just have to put a user input with fake fields before the Facebook node in order to start the stream. In this example we use a user input with: Field a (see the screenshot below).
<p align="center">
  <img src="img/Source.png"/ width=80%>
</p>

###### 2\.  
Double click on the 'Facebook Comments' node.
<p align="center">
  <img src="img/UI.png"/ width=80%>
</p>
Now fill the fields:
* ‘Post ID’. For example, you can use a Post ID you got by using the [‘Facebook Posts’](../Facebook Posts) node.
* ‘Number of comments desired’. The number you specify is the maximum number of comments returned.
* ‘Access Token’. To access data from Facebook you need to have an authentication key that enables you the access via the API. Follow the [tutorial](https://github.com/jonnyenglish/SPSSFacebook#how-to-get-a-facebook-access-token--step-by-step-tutorial).

###### 3\.
Add an output node after the ‘Facebook Posts’ node, in order to visualize the data you gathered. For example you can start with a ‘Table’.
Click on the table and run the stream.  
<p align="center">
  <img src="img/Run.png"/ width=300px>
</p>
Here is what we obtain:
<p align="center">
  <img src="img/Output.png"/ width=80%>
</p>

###### 4\.
Now, it’s your turn to gather social data directly into SPSS and start text mining customer opinions. [This](http://www.brianmcnay.com/text-mining/text-mining-tutorial-using-spss-modeler.html) is a good Tutorial to get started.
