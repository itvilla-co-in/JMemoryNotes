package a2passingvalues;

public class empmain {

	public static void main(String[] args) {
		 
		emp e1 = new emp("John","IT");
		displaymethod(e1);
		System.out.println("Name of employee in display main : "+ e1.getName());
	}

	private static void displaymethod(emp e1) {
		 e1.setName("Carlos");
		 System.out.println("Name of employee in display method : "+ e1.getName());
	}

}
