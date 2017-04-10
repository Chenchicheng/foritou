package cn.foritou.model;

import java.math.BigDecimal;

/**
 * Discount entity. @author MyEclipse Persistence Tools
 */

public class Discount implements java.io.Serializable {

	// Fields

	private Integer id;
	private String discount;
	private BigDecimal personprice;
	private Size size;
	private Shop shop;
	// Constructors

	/** default constructor */
	public Discount() {
	}

	/** full constructor */


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public Discount(Integer id, String discount,BigDecimal personprice , Size size,
			Shop shop) {
		super();
		this.id = id;
		this.discount = discount;
		this.personprice = personprice;
      	this.size=size;
		this.shop=shop;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDiscount() {
		return this.discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
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

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}



}