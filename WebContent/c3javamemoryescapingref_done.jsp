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

Lets understand this by an example. Lets say that we have a class person as shown below
and a class employee which has a dependancy  of class person as shown below. 

</br>
package a4_escaping_ref_simple1;

public class Person {
	  private String name;
	  private int age;
	  
	  public Person(String personName, int personAge) {
	    name = personName;
	    age = personAge;
	  }
	        
	  
	  public String getName() { return name; }
	  public int getAge() { return age; }


	public void setName(String name) {
		this.name = name;
	}


	public void setAge(int age) {
		this.age = age;
	}
	  
	  
	}

</br></br>

package a4_escaping_ref_simple1;

public class Employee {
	
	private Integer id;
	private Person person;
	private String grade;
	
	Employee(Integer id, Person p, String grade)
	{
		this.id=id;
		this.person=p;
		this.grade=grade;
	}

	public Integer getId() {
		return id;
	}

	public Person getPerson() {
		return person;
	}

	public String getGrade() {
		return grade;
	}
	
	
	

}
</br>

Now our requirement is that when once a person is created no body should be able to 
modify the person details. 

</br>
Person p = new Person("John",16);
Employee e = new Employee(1,p, "Manager");
</br>
Problem here is that we have a getter method in class Employee as below which is 
returning the reference to our person object. 
</br>
public Person getPerson() {
		return person;
	}
	
See our Main client below.

package a4_escaping_ref_simple1;

public class main {
	
	public static void main(String [] args)
	{
		
		Person p = new Person("John",16);
		Employee e = new Employee(1,p, "Manager");
		
		// some code who is getting the person from employee
		Person temp = e.getPerson();
		System.out.println("Getting the current name of temp :  " + temp.getName());
		temp.setName("virus");
		System.out.println("Getting the current name of temp :  " + p.getName());
		
		
	}

}


</br>
temp has reference to our actual person and any changes to temp will result change in 
actual person details.  Here we might have passed the reference to our object with an 
intention that No one should be able to change the state of the object. 
</br>
This is called Mutation of object. When we say some objects are immutable that is nothing
but no one can actually change any property of that object. We will see how to create
such objects.

</br>
Now lets say that we want to pass a copy which is actually not referring to our actual person.
</br>
It time to learn one more term now.
</br>
Defensive copying
</br>
A mutable object is simply an object which can change its state after construction. 
For example, StringBuilder and Date are mutable objects, while String and Integer are 
immutable objects.
</br>
A class may have a mutable object as a field. There are two possible cases for how the 
state of a mutable object field can change:
</br>

    its state can be changed only by the native class(in our example person) - the native class creates the mutable object field, 
    and is the only class which is directly aware of its existence</br>
    its state can be changed both by the native class and by its callers - the native class simply points to a mutable 
    object which was created elsewhere</br>

</br>
Both cases are valid design choices, but you must be aware of which one is appropriate for each case.
</br>
If the mutable object field's state should be changed only by the native class, then a defensive copy of the mutable object 
must be made any time it's passed into (constructors and set methods) or out of (get methods) the class. 
If this is not done, then it's simple for the caller to break encapsulation, by changing the state of an object which is 
simultaneously visible to both the class and its caller. 


 /**
  * Returns a mutable object - good style.
  * 
  * Returns a defensive copy of the field.
  * The caller of this method can do anything they want with the
  * returned Date object, without affecting the internals of this
  * class in any way. Why? Because they do not have a reference to 
  * fDate. Rather, they are playing with a second Date that initially has the 
  * same data as fDate.
  */
  public Person getPerson() {
    return new Person();
  }



Lets see one more issue.

MOTIVATION

So the problem is that we want to make objects are immutable. What does it mean exactly? We want to make sure users are not able to 
update or remove the values. Lets consider an example.

So first lets create the Customer class.


public class Customer {
 	private String name;
 	public Customer(String name) {
		this.name = name;
	}
 	@Override
	public String toString() {
		return this.name;
	}
}

Lets create CustomerRecords class.  This class stores all the customer related information. 
In this case we just store the name of the customer. Then we can create a data structure (HashMap) to store these customers.

public class CustomerRecords {
 
	private Map<String,Customer> customerRecords;
 
	public CustomerRecords() {
		this.customerRecords = new HashMap<>();
	}
 
	public Map<String,Customer> getCustomers() {
		return this.customerRecords;
	}
}
This CustomerRecords class stores the customers in a HashMap data structure. 

What is the problem with this code? That the user can get the records with the getCustomers() method and can update or remove items. 
This is exactly what we want to avoid.

Note: this violates one of the SOLID principles as well. Classes (modules and functions) should be open for extension but 
closed for modification.


IMMUTABLE COLLECTIONS

So how to deal with this problem? We can use an Iterator instead of returning all the customerRecords. 

But again we can change the content of the records from outside of the class. 
So a better solution is to use ImmutableCollections.

Solution : 1 

This is how we can make sure the content of the HashMap can not be altered from outside.

public class CustomerRecords {
 	private Map<String,Customer> customerRecords;
  	public CustomerRecords() {
		this.customerRecords = new HashMap<>();
	}
 	public Map<String,Customer> getCustomers() {
		return Collections.unmodifiableMap(this.customerRecords);
	}
}



</br>
Solution 2 : 

</br>
Consider the example where a method makes a defensive copy of an object and returns the copy to the caller.
</br>
Type  1 :
</br> 
Change the getter method of person in employee as below to retrun a new 
person instead of passing reference to the same object. 
</br>
	public Person getPerson() {
		return new Person(person);
	}
	
	</br>
Type  2 : Add a constructor on person to accept person as argument. This type of
constructor are also called as Copy Constructor.
 </br>
Copy Constructor is used to create and exact copy of an object with the same values of an existing object.

</br>
		  public Person(Person p) {
		  this(p.getName(), p.getAge());
	}
	
</br>
Soution 3 :
</br>
Create a readonly copy of the person and send the read only copy which only has
getter methods and not setter methods. 
</br>
Step 1 : Refator the person as interface and remove the setter methods</br>
Step 2 : Pass the readonly interface reference then passing the copy with setter methods.</br>

</br>		
	
		

</body>
</html>