<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


In  langauges like C/C++ developer  is responsible for both creation and destruction 
of objects. If developer does not do the JOB of destorying the objects correctly then due to this negligence  at some point 
there might not be sufficient memory  for  entire program to create new objects and your application/program  
will terminate abnormally causing OutOfMemoryErrors. This is called as memory Leak.

Thanks to Java the developer need not worry about object destruction. Garbage collector destroys these objects on its own.
Garbage collector is like a  Daemon thread as it is always running in background and keep on identifying the unused objects 
and destorys them to free up the memory.

Memory leaks can be hard to find and troubleshoot.



What is Automatic Garbage Collection?
Automatic garbage collection is the process of looking at heap memory, identifying which 
objects are in use and which are not, and deleting the unused objects. An in use object,
 or a referenced object, means that some part of your program still maintains a pointer 
 to that object. An unused object, or unreferenced object, is no longer referenced by 
 any part of your program. So the memory used by an unreferenced object can be reclaimed.
 
 So bascially steps followed are.
 1. identify the unused objects. 
 2. Remove the unused objects. 
 
 
 The java.lang.System.gc() method runs the garbage collector. Calling this suggests that 
 the Java Virtual Machine expend effort toward recycling unused objects in order to make 
 the memory they currently occupy available for quick reuse.
 
 << Images of how GC pick up the unrefenced objects >>
 
 
 gc actually runs in the background and we dont need to do anything but lets write a small
 program to see the gc method in action.  Note that calling gc method does not mean that
 JVM will actually run it. It might run it might not since gc is something that is controlled 
 by JVM.
 
 
 
Just before destroying an object, Garbage Collector calls finalize() method on the object to perform cleanup activities. Once finalize() method completes, Garbage Collector destroys that object.
finalize() method is present in Object class with following prototype.
protected void finalize() throws Throwable
Based on our requirement, we can override finalize() method for perform our cleanup activities like closing connection from database.

The finalize() method called by Garbage Collector not JVM. Although Garbage Collector is one of the module of JVM.
Object class finalize() method has empty implementation, thus it is recommended to override finalize() method to dispose of system resources or to perform other cleanup.
The finalize() method is never invoked more than once for any given object.
If an uncaught exception is thrown by the finalize() method, the exception is ignored and finalization of that object terminates.






</body>
</html>