package cn.foritou.model;

import java.sql.Timestamp;

/**
 * Wxshop entity. @author MyEclipse Persistence Tools
 */

public class Wxshop implements java.io.Serializable {
	// Fields
	private Integer id;
	private String shopname;
	private String shopimage;
	private String discount;
	private Double score;
	private String shoptype;
	private String miaoshu;
	private Shop  shop;
	private Company company;
	private State state;
	private Timestamp date;
	private Timestamp validdate;
	// Constructors
	/** default constructor */
	public Wxshop() {
	}
	/** full constructor */
	public Wxshop(String shopname,String shopimage, String discount, Double score,
			String shoptype,String miaoshu, Shop shop,Company company,State state,Timestamp date,Timestamp validdate) {
		this.shopname = shopname;
		this.shopimage=shopimage;
		this.discount = discount;
		this.score = score;
		this.shoptype = shoptype;
		this.shop=shop; 
		this.company=company;
		this.date=date;
		this.state=state;	
		this.validdate=validdate;
		this.miaoshu=miaoshu;
	}
	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShopname() {
		return this.shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getDiscount() {
		return this.discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public Double getScore() {
		return this.score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

	public String getShoptype() {
		return this.shoptype;
	}

	public void setShoptype(String shoptype) {
		this.shoptype = shoptype;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public State getState() {
		return state;
	}

	public void setState(State state) {
		this.state = state;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}
	public Timestamp getValiddate() {
		return validdate;
	}
	public void setValiddate(Timestamp validdate) {
		this.validdate = validdate;
	}
	public String getShopimage() {
		return shopimage;
	}
	public void setShopimage(String shopimage) {
		this.shopimage = shopimage;
	}
	public String getMiaoshu() {
		return miaoshu;
	}
	public void setMiaoshu(String miaoshu) {
		this.miaoshu = miaoshu;
	}


}