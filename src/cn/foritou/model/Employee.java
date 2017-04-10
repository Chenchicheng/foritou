package cn.foritou.model;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */

public class Employee implements java.io.Serializable {

	// Fields

	private Integer id;
	private String weixin;
	private String phone;
	private Company company;
	private String password;
	private String nickname;
	private String headappear;
	private String sex;
	private String province;
	private String city;
	private String interpassword;

	// Constructors

	/** default constructor */
	public Employee() {
	}

	/** full constructor */
	public Employee(String weixin, String phone,Company company, String password,
			String nickname, String headappear, String sex, String province,String city,
			String interpassword) {
		this.weixin = weixin;
		this.phone = phone;
	    this.company=company;
		this.password = password;
		this.nickname = nickname;
		this.headappear = headappear;
		this.sex = sex;
		this.province=province;
		this.city=city;
		this.interpassword = interpassword;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getWeixin() {
		return this.weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}



	

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getHeadappear() {
		return this.headappear;
	}

	public void setHeadappear(String headappear) {
		this.headappear = headappear;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getInterpassword() {
		return this.interpassword;
	}

	public void setInterpassword(String interpassword) {
		this.interpassword = interpassword;
	}

}