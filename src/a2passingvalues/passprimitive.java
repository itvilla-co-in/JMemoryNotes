package a2passingvalues;

public class passprimitive {
	
	public static void main(String [] args)
	{
		int a=10;
		int b=20;
		calc(a,b);
		System.out.println("Value of a :  " + a);
		System.out.println("Value of b :  " + b);
	}

	private static void calc(int a, int b) {
		a=100;
		b=200;
	}

}
