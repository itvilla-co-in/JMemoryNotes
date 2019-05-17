package a4_escaping_ref_part2_solution2;

public class Singer implements SingerReadOnly {
	
	private String name;
	private String Country;
	
	
	public Singer(String name, String country) 
	{
		this.name = name;
		this.Country = country;
	}


	/* (non-Javadoc)
	 * @see a4_escaping_ref_part2_solution2.SingerReadOnly#getName()
	 */
	@Override
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	/* (non-Javadoc)
	 * @see a4_escaping_ref_part2_solution2.SingerReadOnly#getCountry()
	 */
	@Override
	public String getCountry() {
		return Country;
	}
	
	public void setCountry(String country) {
		Country = country;
	}

	/* (non-Javadoc)
	 * @see a4_escaping_ref_part2_solution2.SingerReadOnly#toString()
	 */
	@Override
	public String toString() {
		return "Singer [name=" + name + ", Country=" + Country + "]";
	}

}
