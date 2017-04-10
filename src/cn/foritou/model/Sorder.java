package cn.foritou.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * Sorder entity. @author MyEclipse Persistence Tools
 */

public class Sorder implements java.io.Serializable {

	// Fields

	private Integer id;
	private String shopname;
	private String shopimage;
	private BigDecimal personprice;
	private String discount;
	private Integer personnumber;
	private Shop shop;
	private Forder forder;
	// Constructors
	/** default constructor */
	public Sorder() {
	}

	/** full constructor */


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public Sorder(String shopname, String shopimage, BigDecimal personprice,
			Integer personnumber, Shop shop, Forder forder,String discount) {
		super();
		this.shopname = shopname;
		this.shopimage = shopimage;
		this.personprice = personprice;
        this.discount=discount;
		this.personnumber = personnumber;
		this.shop = shop;
		this.forder = forder;
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

	public Integer getPersonnumber() {
		return this.personnumber;
	}

	public void setPersonnumber(Integer personnumber) {
		this.personnumber = personnumber;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Forder getForder() {
		return forder;
	}

	public void setForder(Forder forder) {
		this.forder = forder;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}



}