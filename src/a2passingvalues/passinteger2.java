package a2passingvalues;

public class passinteger2 {
	
	public static void main(String [] args)
	{
		Integer a=10;
		Integer b=20;
		calc(a,b);
		System.out.println("Value of a :  " + a);
		System.out.println("Value of b :  " + b);
	}

	private static void calc(Integer a, Integer b) {
		a=100;
		b=200;
	}

}
