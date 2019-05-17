package a8_meoryleak;

import java.util.Map;

public class Mapmain {

	public static void main(String[] args) {
		 
		 Map<Object, Object> map = System.getProperties();
		    while (true) 
		    {
		        map.put(new Key("key"), "value");
		        
		    }


}
	
}