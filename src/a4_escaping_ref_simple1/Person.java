package a4_escaping_ref_simple1;

public class Person {
	  private String name;
	  private int age;
	  
	  public Person(String personName, int personAge) {
	    name = personName;
	    age = personAge;
	  }
	        
	  
	  public String getName() { return name; }
	  public int getAge() { return age; }


	public void setName(String name) {
		this.name = name;
	}


	public void setAge(int age) {
		this.age = age;
	}
	  
	  
	}