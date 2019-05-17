package a4_escaping_ref_simple3;

public class Employee {
	
	private Integer id;
	private PersonReadOnly person;
	private String grade;
	
	Employee(Integer id, PersonReadOnly p, String grade)
	{
		this.id=id;
		this.person=p;
		this.grade=grade;
	}

	public Integer getId() {
		return id;
	}

	public PersonReadOnly getPerson() {
		return person;
	}

	public String getGrade() {
		return grade;
	}
	
	
	

}
