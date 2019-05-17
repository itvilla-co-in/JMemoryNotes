<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

Mark and Sweep Algorithm
Any garbage collection algorithm must perform 2 basic operations. One, it should be able to detect all the unreachable objects and secondly, it must reclaim the heap space used by the garbage objects and make the space available again to the program.
The above operations are performed by Mark and Sweep Algorithm in two phases:
1) Mark phase
2) Sweep phase.



Young generation is where young objects live. Its further subdivided into the following areas:

Eden Space
Survivor Space 1
Survivor Space 2

By default, Eden is bigger than the two survivor spaces combined. On my Mac OS X with 64-bit HotSpot JVM, Eden takes about 76% of 
all the young generation space. All objects are first created here. When Eden is full, a minor garbage collection is triggered. 
All new objects are quickly inspected to check their eligibility for garbage collection. The ones that are dead, that is, arent 
referenced (ignoring reference strength for this discussion) from other objects are marked as dead and garbage collected.
 
Survior space is used like a temp swap. The surviving objects are moved to one of the empty survivor spaces.  

Using Memory Analyze tool :

You can take a heap dump from the jvisualvm.  You can use the MAT Tool. 

File -> Open Heap Dump -> Import the heap dump file. 

memorytoolmat1.png

Choose one of the report. Lets start with Leak suspect Report. It will show what objects are taking how much space. 
Since our example is simple it will show a repot like below which shows one object is taking most of the space. 
 


memorytoolmat2.png

It shows the problem statement and when you click Details it will show the stack track of that memory leak. 

memorytoolmat3.png



memorytoolmat4.png

In Java 6 World there used to be PermGen/Metaspace beyond Young and Old, i.e objects in PermGem will survive for life. Two types of objects goes to permgen
intern string, Class Metadata(its not instance and object itself its just metadata of class). 

Server Application on Tomcat each time you redeploy to server new version of metadaat is created in perm gen and old metadata is already
there on pergen and it will grow, so you might want to consider restarting tomcat so that permgen is cleared. 

memorytoolmat5.png

From Java 8 and beyond they removed Permgen for ever and introduced metaspace, its allocated outside the computer memory and 
can be defined. With Java 8 on redployment it will delete the the class metadata.  



memorytoolmat6.png



By default the heap dump is created in a file called java_pid.hprof in the working directory of the VM, as in the example above.
 You can specify an alternative file name or directory with the -XX:HeapDumpPath= option. 
 For example -XX:HeapDumpPath=/disk2/dumps will cause the heap dump to be generated in the /disk2/dumps directory.
 
memorytoolmat7.png


-verbose:gc Print console when GC takes place.




Now you can use a tool like Jmeter to create a post request/GET request for your HTTP request and force multiple threads
to see how you application is performing and how is the memory utilized. Now  if you memory is getting full then you can 
plan to create a tomcat dump and open in MAT tool.

MAT tool leak report will tell you Problem Objects like we saw above. 

It exactly tell you the class and object that is problem suspect. 

memorytoolmat8.png

Now you need to look at the class and see how you have designed the array list. Below figure will show you the class that 
is the problem.


memorytoolmat9.png

If you see you have defined a static array list which is not going to be gc collected and your program is going to keep on
adding the you might not even need that array list.

 




 
 







</body>
</html>