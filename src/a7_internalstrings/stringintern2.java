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
