package a7_gcbasic;

public class main {
	
	public static void main(String [] args)
	{
		// getting the current memory of the system. 
		Runtime r1 = Runtime.getRuntime();
		long memory = r1.freeMemory(); 
		
		System.out.println("Memory at the start of project " + memory);
		for(int i = 0;i<=100000;i++)
		{
		Person p = new Person("John",16);
		Employee e = new Employee(1,p, "Manager");
		} // all employees are ready for gc to be collected at this scope. 
		
		System.gc();
		memory = r1.freeMemory();
		System.out.println("Memory at the start of project " + memory);
		for(int i = 0;i<=100000;i++)
		{
		Person p = new Person("John",16);
		Employee e = new Employee(1,p, "Manager");
		} // all 
		
		System.out.println("Memory at the start of project " + memory);
		
	}

}
