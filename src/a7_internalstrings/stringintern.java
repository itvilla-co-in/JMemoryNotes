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
