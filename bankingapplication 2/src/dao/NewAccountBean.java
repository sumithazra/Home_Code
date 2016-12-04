/**@author:sumit
 * @date:21-10-2013
 * @implementation_of_changer_equest:CR001
 * @description: It's bean class like as POJO file to accept form data.
*/
package dao;

public class NewAccountBean
{   /** empty public constructor of this class.*/
	public NewAccountBean(){}
	/** declared variables to hold value of form's element in POJO file.*/
	private String acc_type2;
    private String fname2;
    private String mname2;
    private String lname2;
 	private String dob;
 	private String sex2;
 	private String marital_stat2;
 	private String email2;
 	private String occ;
 	private String address2;
 	private String city2;
 	private String state2;
 	private String country2;
 	private int zipcode2;
 	private String landline2;
 	private String mobile2;
 	private String ans;

 	/** All getter & setter methods.
 	 * 	setter method initialize value to respective defined variable.
 	 *  getter method returns earlier initialized value in all variable.
 	 */
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public String getAcc_type2() {
		return acc_type2;
	}
	public void setAcc_type2(String acc_type2) {
		this.acc_type2 = acc_type2;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity2() {
		return city2;
	}
	public void setCity2(String city2) {
		this.city2 = city2;
	}
	public String getCountry2() {
		return country2;
	}
	public void setCountry2(String country2) {
		this.country2 = country2;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getFname2() {
		return fname2;
	}
	public void setFname2(String fname2) {
		this.fname2 = fname2;
	}
	public String getLandline2() {
		return landline2;
	}
	public void setLandline2(String landline2) {
		this.landline2 = landline2;
	}
	public String getLname2() {
		return lname2;
	}
	public void setLname2(String lname2) {
		this.lname2 = lname2;
	}
	public String getMarital_stat2() {
		return marital_stat2;
	}
	public void setMarital_stat2(String marital_stat2) {
		this.marital_stat2 = marital_stat2;
	}
	public String getMname2() {
		return mname2;
	}
	public void setMname2(String mname2) {
		this.mname2 = mname2;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getOcc() {
		return occ;
	}
	public void setOcc(String occ) {
		this.occ = occ;
	}
	public String getSex2() {
		return sex2;
	}
	public void setSex2(String sex2) {
		this.sex2 = sex2;
	}
	public String getState2() {
		return state2;
	}
	public void setState2(String state2) {
		this.state2 = state2;
	}
	public int getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(int zipcode2) {
		this.zipcode2 = zipcode2;
	}
}
