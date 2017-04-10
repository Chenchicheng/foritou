package cn.foritou.model;

import java.math.BigDecimal;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer shopid;
	private String shopname;
	private Double score;
	private BigDecimal price;
	private String miaoshu;
	private String pic;
	private Integer sold;
	private Integer comment;
	private String discount;
	private Shoptype shoptype;
	private String stpic;
	private Shop shop;

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(String shopname,Integer shopid, Double score, BigDecimal price, String miaoshu,
			String pic, Integer sold, Integer comment, String discount,
			Shoptype shoptype, String stpic, Shop shop) {
		this.shopname = shopname;
		this.shopid=shopid;
		this.score = score;
		this.price = price;
		this.miaoshu = miaoshu;
		this.pic = pic;
		this.sold = sold;
		this.comment = comment;
		this.discount = discount;
		this.shoptype = shoptype;
		this.stpic = stpic;
		this.shop = shop;
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

	public Double getScore() {
		return this.score;
	}

	public void setScore(Double score) {
		this.score = score;
	}


	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getMiaoshu() {
		return this.miaoshu;
	}

	public void setMiaoshu(String miaoshu) {
		this.miaoshu = miaoshu;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Integer getSold() {
		return this.sold;
	}

	public void setSold(Integer sold) {
		this.sold = sold;
	}

	public Integer getComment() {
		return this.comment;
	}

	public void setComment(Integer comment) {
		this.comment = comment;
	}

	public String getDiscount() {
		return this.discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}



	public Shoptype getShoptype() {
		return shoptype;
	}

	public void setShoptype(Shoptype shoptype) {
		this.shoptype = shoptype;
	}

	public String getStpic() {
		return this.stpic;
	}

	public void setStpic(String stpic) {
		this.stpic = stpic;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Integer getShopid() {
		return shopid;
	}

	public void setShopid(Integer shopid) {
		this.shopid = shopid;
	}



}