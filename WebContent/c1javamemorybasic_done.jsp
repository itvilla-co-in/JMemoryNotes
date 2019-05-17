<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</br>
In Java developer does not need to explicitly allocate and deallocate memory 
the JVM and more specifically the Garbage Collector has the duty of handling memory 
allocation like in other langauages  like C where a programmer has direct access 
to memory and literally references memory cells in his code, creating a lot of oppertunites
for memory leaks.

</br></br>

To start with two main terms that we need to understand to better understand 
memory management in Java is Stack and Heap. 

</br></br>
Java applications need a certain amount of RAM on a computer to run. Each time an object 
or variable is declared, it needs more RAM. To keep application memory requirements lean and structured, 
it is partitioned in ways that require less memory and allows the application to run more 
quickly. In real time application there are large sized objects created. The Java Virtual Machine (JVM) divides memory 
between Java Heap Space and Java Stack Memory in a way that only uses memory thats needed.
There is more to just these two partitions but to start with lets keep things simple. 
</br></br>
Stack and Heap Basic
</br></br>

Primitives are stored on the stack.
All Objects are stored on Heap.  
Referecne to Objects are stored in Heap. 

</br></br>
Lets consider a very small example here.  
 </br></br>
package a1basic;

public class stackheap1 {

	public static void main(String[] args) {
		// line1 
		int count = 1;
		// line2
		String name = "itvilla";
		System.out.println(" Displaying Count : " + count);
		System.out.println(" Displaying String : " + name);
	}

}

</br></br></br>
line 1 we are allocating a int/primitive variable on the stack first so it will
be created on stack first</br>

line 2 we are creating  a String object with name as reference and actual value 
is "itvilla". here is how stack and heap looks.</br>


Here is how it looks on memory. </br>

 
<img src="javamemory1.png" alt="javamemory1.png"> 

</br>
So we can see the reference to object of type String is stored on the stack but actual
object is store on Heap, so that happens for any object in Java. For now lets keep that
understanding. 


 
</br>


Lets take one more example to understand Stack and heap. 
</br></br>
package a1basic;

import java.util.ArrayList;
import java.util.List;

public class stackheap2 {

	public static void main(String[] args) 
	{
		//line1
		List<String> namelist = new ArrayList<String>();
		//line2
		namelist.add("John");
		//line3
		namelist.add("Amit");
		//line4
		namelist.add("Donna");
		//line5
		displaymethod(namelist);
	}

	private static void displaymethod(List<String> templist) 
	{
		System.out.println("diplay the list" + templist);
	}
	
	

}

</br></br>
 
 Note here in below image how the list is referenced from stack and actual data stays 
 on heap. The scope of stack is at method level that is the reason why data is shown 
 in the main thread. 
 
 </br>
 
 <img src="javamemoryn2.png" alt="javamemory2.png"> 
 
 </br>
 Note here when we come to displaymethod from main a new method gets added on top of your
 stack and now the scope is display method. See the templist is a new variable but it 
 points to the same list. 
 </br>
 
 <img src="javamemoryn3.png" alt="javamemory3.png"> 

	
 
 </br>
 Note an important point here is that once the control leaves that a method those variables are
 removed from stack. For example when the method exit line is executed the templist variable
 is removed from stack and once the main method exits namelist is removed from stack. 
  
 </br>
 
Let us do one more change in the same example. 

 
 </br>
 
 package a1basic;

import java.util.ArrayList;
import java.util.List;

public class stackheap2 {

	public static void main(String[] args) 
	{
		//line1
		List<String> namelist = new ArrayList<String>();
		//line2
		namelist.add("John");
		//line3
		namelist.add("Amit");
		//line4
		namelist.add("Donna");
		//line5
		displaymethod(namelist);
	}

	private static void displaymethod(List<String> templist) 
	{
		String name1 = templist.get(0);
		templist.add("Carlo");
		templist.add("Liona");
		System.out.println("diplay the list" + templist);
		
	}
	
	

}
 </br>
 
  When we are adding to the list in the displaymethod its getting added to the same list 
  that is pointed by the main method since they are both pointing to the same list in the 
  heap.  So now even main method variable namelist has accesss to the new members that 
  are added by the display method. 
  
  </br>

 <img src="javamemoryn5.png" alt="javamemory3.png"> 
 
 </br>
 

</body>
</html>