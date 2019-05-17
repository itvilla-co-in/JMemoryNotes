<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Does Java Pass by Value or Pass by Reference ? Lets consider below example to under how java passes values. 
</br></br>

package a2passingvalues;

public class passprimitive {
	
	public static void main(String [] args)
	{
		int a=10; // line 1
		int b=20; // line 2
		calc(a,b); // line 3
		System.out.println("Value of a :  " + a);
		System.out.println("Value of b :  " + b);
	}

	private static void calc(int a, int b) 
	{
		a=100;
		b=200;
	}

}

</br></br>
We have learned that primitive values stay on the stack.  When the calc method is called 
it creates its own copy of the local variables.  The values of a and b in the main method is not 
impacted or updated, so its strictly pass by value. 
</br></br>
See the image below. 
</br></br>
<img src="javamemoryn6.png" alt="javamemoryn6.png">


</br></br>
Output of the program is :
</br></br>

Value of a :  10</br>
Value of b :  20</br>

</br></br>

Now this is slightly different in case of objects for which only the reference is stored 
in the stack and actual values are in the heap.
</br></br>
Lets consider a simple class as below :
</br></br>
package a2passingvalues;

public class emp {

	String name;
	String department;
	
	public emp(String name, String department) {
		super();
		this.name = name;
		this.department = department;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}
	
	
	
	
}

</br></br>
Out main method looks like this :
</br></br>
package a2passingvalues;

public class empmain {

	public static void main(String[] args) {
		 
		emp e1 = new emp("John","IT");
		displaymethod(e1);
		System.out.println("Name of employee in display main : "+ e1.getName());
	}

	private static void displaymethod(emp e2) {
		 e1.setName("Carlos");
		 System.out.println("Name of employee in display method : "+ e1.getName());
	}

}


</br></br>
Let try to see what is happening in memory.</br> 
Step 1 : Object is created in the main method.</br> 
Step 2 : You call display method and pass the object and create a copy in e2.  Here
a copy is created on the stack but in heap its referencing the same object. 
Step 3 : You modify the object from display method which is referenced by your main</br> 
method too. So the changes gets reflected in this case. 
</br></br>
<img src="javamemoryn7.png" alt="javamemoryn7.png">

</br></br>


Conclusion :
So actually java pass by values, in object scenario also you are actually pass the value of memory location of object 
but since you are pointing to the same memory location when you use setter methods you acutally modify the properites of the object
not the object memory location itself. 

</body>
</html>