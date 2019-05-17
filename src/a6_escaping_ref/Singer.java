package a6_escaping_ref;

public class Singer {
	
	private String name;
	private String Country;
	
	
	public Singer(String name, String country) 
	{
		this.name = name;
		this.Country = country;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCountry() {
		return Country;
	}
	
	public void setCountry(String country) {
		Country = country;
	}

	@Override
	public String toString() {
		return "Singer [name=" + name + ", Country=" + Country + "]";
	}

}
