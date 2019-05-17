package a1basic;

import java.util.ArrayList;
import java.util.List;

public class stackheap2 {

	public static void main(String[] args) 
	{
		//line1
		List<String> namelist = new ArrayList<String>();
		//line2
		namelist.add("John");
		//line3
		namelist.add("Amit");
		//line4
		namelist.add("Donna");
		//line5
		displaymethod(namelist);
	}

	private static void displaymethod(List<String> templist) 
	{
		System.out.println("diplay the list" + templist);
	}
	
	

}
