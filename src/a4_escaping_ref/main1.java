package a4_escaping_ref;

import java.util.Iterator;
import java.util.Map;

public class main1 {
	
	public static void main(String [] args)
	{
		
		SongRecord s1 = new SongRecord();
		
		Singer singer1 = new Singer("John","India");
		Singer singer2 = new Singer("Donna","USA");
		Singer singer3 = new Singer("Carlos","France");
		
		s1.addnewsinger(singer1, "mysong1");
		s1.addnewsinger(singer2, "mysong2");
		s1.addnewsinger(singer3, "mysong3");
		
//		for (Map.Entry<String, Singer> entry : s1.getSongdatabase().entrySet()) 
//		{
//		    System.out.println("" + entry.getKey());
//		    System.out.println("" + entry.getValue());
//		}
				
		for (Singer s : s1) 
		{
		    System.out.println("" + s);	    
		}
		
		

		s1.getSongdatabase().clear();
		
		System.out.println("Lets run the same loop ");
		
		for (Singer s : s1) 
		{
		    
			System.out.println("" + s);
		 
		}
		
		
		
		
		
	}	 
	
}
