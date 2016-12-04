
public class Student {

	private String stuID;
	private String name;
	
	
	public String getStuID() {
		return stuID;
	}
	public void setStuID(String stuID) {
		this.stuID = stuID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String toString()
	{
		return "Student ID:"+stuID+" name:"+name;
	}
	
	
	
}
