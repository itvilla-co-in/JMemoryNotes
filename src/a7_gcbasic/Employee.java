package a7_gcbasic;

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
		return person;
	}

	public String getGrade() {
		return grade;
	}
	
	
	

}
