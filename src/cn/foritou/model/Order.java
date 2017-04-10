package cn.foritou.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer id;
	private String shopname;
	private String discount;
	private String shopimage;
	private BigDecimal personprice;
	private Timestamp date;
	private Integer personnumber;
	private Shop  shop;
	private Status status;
     private Company company;
	// Constructors

	/** default constructor */
	public Order() {
	}

	/** full constructor */
	public Order(String shopname, String discount, String shopimage,
			BigDecimal personprice,Shop shop, Status status,Integer personnumber,Company company,Timestamp date) {
		this.shopname = shopname;
		this.discount = discount;
		this.shopimage = shopimage;
		this.personprice = personprice;
	    this.shop=shop;
	    this.status=status;
	    this.personnumber=personnumber;
	    this.company=company;
	    this.date=date;
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

	public String getShopimage() {
		return this.shopimage;
	}

	public void setShopimage(String shopimage) {
		this.shopimage = shopimage;
	}


	public BigDecimal getPersonprice() {
		return personprice;
	}

	public void setPersonprice(BigDecimal personprice) {
		this.personprice = personprice;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Integer getPersonnumber() {
		return personnumber;
	}

	public void setPersonnumber(Integer personnumber) {
		this.personnumber = personnumber;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}



}