package a4_escaping_ref_part2_Solution1;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class SongRecord implements Iterable<Singer>{
	
	private Map<String, Singer> songdatabase;

	
	
	public SongRecord() {
	 
		this.songdatabase = new HashMap<String, Singer>();
	}

	public void addnewsinger(Singer o,String song)
	{

		this.songdatabase.put(song, o);
 
	}
	
	public Map<String, Singer> getSongdatabase() 
	{
		return this.songdatabase;
	}

	public Singer getsingerbyname(String name)
	{
		//return this.songdatabase.get(name);
		return new Singer(this.songdatabase.get(name));
	}
	
	
	@Override
	public Iterator<Singer> iterator() {
		 
		return songdatabase.values().iterator();
	}

}
