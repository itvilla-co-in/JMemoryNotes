<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


Lets understand final keyword now from memory prespective.  lets say that we have an class called as employee or emp
as below. 
</br>

package a3final;

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

</br>

Now lets create a final object of this type. 

</br>


final emp e1 = new emp("John","IT");

</br>

<img src="javamemoryn8.png" alt="javamemoryn8.png"> 

</br>
Now what we understand is that we cannot change the object since its final, 
but this statement is not exactly true.  
</br>
We cannot assign e1 = new emp("Donna","Sales") but we can use the setter method 
of e1 to change the properties of e1. i.e we can change the name,department so 
actually the object state is not final it can still be changed. 
</br>

See example below :
</br>
package a3final;

public class javafinal {
	
	public static void main(String [] args)
	{
		// I can do this
		emp e1 = new emp("John","Sales");
		e1 = new emp("Donna","IT");
		// if i delcare e2 as final like this   
		final emp e2 = new emp("John","Sales");
		//i cannot do this e2 = new emp("Donna","IT");
		// but i can still change the value of the object. 
	    e2.setName("Amit");
	    System.out.println("Name of e2 :  " + e2.getName() );
	}

}
</br>

Output
</br>
Name of e2 :  Amit


Conclusion :
So just by declaring object as final you cannot say that its immutable. 



</body>
</html>