package a8_meoryleak;

import java.util.ArrayList;

public class main {
	
	public static void main(String [] args)
	{
		// getting the current memory of the system. 
		
		final ArrayList<Employee> list = new ArrayList<Employee>();
		
		for(long i = 0;i<=1000000000;i++)
		{
		Person p = new Person("John",16);
		Employee e = new Employee(1,p, "Manager");
		list.add(e);
		} // all employees are ready for gc to be collected at this scope. 
		
		System.out.println("Done");
		
	}

}
