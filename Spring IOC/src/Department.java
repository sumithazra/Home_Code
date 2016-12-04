import java.util.List;


public class Department {

	private String subjectID;
	private String subName;
	private List<Faculty> facultyStuff;
	
	
	public String getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(String subjectID) {
		this.subjectID = subjectID;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public List<Faculty> getFacultyStuff() {
		return facultyStuff;
	}
	public void setFacultyStuff(List<Faculty> facultyStuff) {
		this.facultyStuff = facultyStuff;
	}
	
	
}
