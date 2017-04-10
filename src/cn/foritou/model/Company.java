package cn.foritou.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Company entity. @author MyEclipse Persistence Tools
 */

public class Company implements java.io.Serializable {
	// Fields
	private Integer id;
	private String companyname;
	private String phone;
	private String province;
	private String city;
	private  Companytype companytype;
	private String password;
	private String contactname;
	private String interpassword;
	private String email;
	private Timestamp enrolltime;
	private Integer enumber;
	private String backup3;
	private Integer inviteid;
	private BigDecimal money;
	private Set<Employee> employeeSet=new HashSet<Employee>();
	private Set<Order> orderSet=new HashSet<Order>();
    private Set<Collection> collectSet =new HashSet<Collection>();
	// Constructors
    public String flag;
    private String md5flag;
    
	public String getMd5flag() {
		return md5flag;
	}
	public void setMd5flag(String md5flag) {
		this.md5flag = md5flag;
	}
	/** default constructor */
	public Company() {
	}
	/** full constructor */
	public Company(String companyname, String phone, String province,
			String city, Companytype companytype, String password, String contactname,
			String interpassword, String email, Timestamp enrolltime,
			Integer enumber, String backup3, Integer inviteid,BigDecimal money) {
		this.companyname = companyname;
		this.phone = phone;
		this.province = province;
		this.city = city;
        this.companytype=companytype;
		this.password = password;
		this.contactname = contactname;
		this.interpassword = interpassword;
		this.email = email;
		this.enrolltime = enrolltime;
		this.enumber = enumber;
		this.backup3 = backup3;
		this.inviteid = inviteid;
		this.money=money;
	}
	public Company(String companyname){
		super();
		this.companyname=companyname;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompanyname() {
		return this.companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}


	public Companytype getCompanytype() {
		return companytype;
	}

	public void setCompanytype(Companytype companytype) {
		this.companytype = companytype;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactname() {
		return this.contactname;
	}

	public void setContactname(String contactname) {
		this.contactname = contactname;
	}

	public String getInterpassword() {
		return this.interpassword;
	}

	public void setInterpassword(String interpassword) {
		this.interpassword = interpassword;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getEnrolltime() {
		return this.enrolltime;
	}

	public void setEnrolltime(Timestamp enrolltime) {
		this.enrolltime = enrolltime;
	}

	public Integer getEnumber() {
		return this.enumber;
	}

	public void setEnumber(Integer enumber) {
		this.enumber = enumber;
	}

	public String getBackup3() {
		return this.backup3;
	}

	public void setBackup3(String backup3) {
		this.backup3 = backup3;
	}

	public Integer getInviteid() {
		return this.inviteid;
	}

	public void setInviteid(Integer inviteid) {
		this.inviteid = inviteid;
	}
	public Set<Employee> getEmployeeSet() {
		return employeeSet;
	}
	public void setEmployeeSet(Set<Employee> employeeSet) {
		this.employeeSet = employeeSet;
	}
    public Set<Order> getOrderSet() {
		return orderSet;
	}
	public void setOrderSet(Set<Order> orderSet) {
		this.orderSet = orderSet;
	}
	public BigDecimal getMoney() {
		return money;
	}
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	public Set<Collection> getCollectSet() {
		return collectSet;
	}
	public void setCollectSet(Set<Collection> collectSet) {
		this.collectSet = collectSet;
	}
	

}