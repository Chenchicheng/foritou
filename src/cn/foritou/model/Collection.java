package cn.foritou.model;

import java.sql.Timestamp;

/**
 * Collection entity. @author MyEclipse Persistence Tools
 */

public class Collection implements java.io.Serializable {

	// Fields

	private Integer id;
	private Company company;
	private Shop shop;
	private Timestamp collectdate;
    private String pic;
	// Constructors

	/** default constructor */
	public Collection() {
	}

	/** full constructor */

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public Collection(Company company, Shop shop, Timestamp collectdate,String pic) {
		super();
		this.company = company;
		this.shop = shop;
		this.collectdate = collectdate;
		this.pic=pic;
	}

	public void setId(Integer id) {
		this.id = id;
	}





	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Timestamp getCollectdate() {
		return this.collectdate;
	}

	public void setCollectdate(Timestamp collectdate) {
		this.collectdate = collectdate;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}