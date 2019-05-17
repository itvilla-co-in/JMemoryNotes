package a4_escaping_ref_simple2;

public class Employee {
	
	private Integer id;
	private Person person;
	private String grade;
	
	Employee(Integer id, Person p, String grade)
	{
		this.id=id;
		this.person=p;
		this.grade=grade;
	}

	public Integer getId() {
		return id;
	}

	public Person getPerson() {
		return new Person(person);
	}

	public String getGrade() {
		return grade;
	}
	
	
	

}
