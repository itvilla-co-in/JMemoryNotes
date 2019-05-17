package a4_escaping_ref_simple3;

public class Person implements PersonReadOnly {
	  private String name;
	  private int age;
	  
	  public Person(String personName, int personAge) {
	    name = personName;
	    age = personAge;
	  }
	        
	  
	  public Person(PersonReadOnly p) {
		  this(p.getName(), p.getAge());
	}


	/* (non-Javadoc)
	 * @see a4_escaping_ref_simple3.PersonReadOnly#getName()
	 */
	@Override
	public String getName() { return name; }
	  /* (non-Javadoc)
	 * @see a4_escaping_ref_simple3.PersonReadOnly#getAge()
	 */
	@Override
	public int getAge() { return age; }


	public void setName(String name) {
		this.name = name;
	}


	public void setAge(int age) {
		this.age = age;
	}
	  
	  
	}
