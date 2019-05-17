<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


String Pools

</br>
 
Java maintains a pool of strings for saving space and for faster comparisons.

</br>

Normally Java programmers are advised to use equals(), not ==, to compare two strings. 
This is because == operator compares memory locations, while equals() method compares 
the content stored in two objects.
</br>
 
Lets uderstand this. 

</br>
package a7_internalstrings;

public class stringintern {
	
	public static void main (String [] args)
	{
		String name1 = "John";
		String name2 = "John";
		
		if(name1.equals(name2)) {System.out.println("Both are equal ");}
		else {System.out.println(" both are not equal ");}
		
		if(name1 == name2) {System.out.println("Both are equal ");}
		else {System.out.println(" both are not equal ");}
		
		System.out.println("**************************************");
		String name3 = new String("John");
		
		if(name2.equals(name3)) {System.out.println("Both are equal ");}
		else {System.out.println(" both are not equal ");}
		
		if(name2 == name3) {System.out.println("Both are equal ");}
		else {System.out.println("Both are not equal ");}
		
		
		
	}

}

</br>
The intern() method helps in comparing two String objects with == operator by looking into the pre-existing pool of string literals
</br>

intern methods check with the java string pool if there is already a string with the same
name exists. if it does exist it reuses that from the pool. But note that Strings 
are immutable objects if we change the contents it creates a new object.
</br> 
Lets wee with example.
 
</br>


package a7_internalstrings;

public class stringintern2 {
	
	public static void main (String [] args)
	{
		String name2 = "John";
		String name3 = new String("John").intern();
		
		if(name2.equals(name3)) {System.out.println("Both are equal ");}
		else {System.out.println(" both are not equal ");}
		
		if(name2 == name3) {System.out.println("Both are equal ");}
		else {System.out.println("Both are not equal ");}
		
		System.out.println("------------------------------");
		name3 = "john1";
		
		if(name2.equals(name3)) {System.out.println("Both are equal ");}
		else {System.out.println(" both are not equal ");}
		
		if(name2 == name3) {System.out.println("Both are equal ");}
		else {System.out.println("Both are not equal ");}
		
		
		
	}

}




</body>
</html>