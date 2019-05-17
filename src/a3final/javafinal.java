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
