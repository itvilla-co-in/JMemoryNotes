package a4_escaping_ref_simple3;

public class main {
	
	public static void main(String [] args)
	{
		
		PersonReadOnly p = new Person("John",16);
		Employee e = new Employee(1,p, "Manager");
		
		// some code who is getting the person from employee
		PersonReadOnly temp = e.getPerson();
		System.out.println("Getting the current name of temp :  " + temp.getName());
		// now you cannot set it temp.setName("virus");
		System.out.println("Getting the current name of temp :  " + p.getName());
		
		
	}

}
