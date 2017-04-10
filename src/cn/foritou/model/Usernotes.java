package cn.foritou.model;

/**
 * Usernotes entity. @author MyEclipse Persistence Tools
 */

public class Usernotes implements java.io.Serializable {

	// Fields

	private Integer id;
	private String validtime;
	private String unabledate;
	private String usetime;
	private String othermoney;
	private String tips;
	private String service;
	private Shop shop;
    private String shopname;
	// Constructors

	/** default constructor */
	public Usernotes() {
	}

	/** full constructor */
	public Usernotes(String validtime, String unabledate, String usetime,
			String othermoney, String tips, String service,Shop shop,String shopname) {
		this.validtime = validtime;
		this.unabledate = unabledate;
		this.usetime = usetime;
		this.othermoney = othermoney;
		this.tips = tips;
		this.service = service;
		this.shop=shop;
		this.shopname=shopname;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getValidtime() {
		return this.validtime;
	}

	public void setValidtime(String validtime) {
		this.validtime = validtime;
	}

	public String getUnabledate() {
		return this.unabledate;
	}

	public void setUnabledate(String unabledate) {
		this.unabledate = unabledate;
	}

	public String getUsetime() {
		return this.usetime;
	}

	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}

	public String getOthermoney() {
		return this.othermoney;
	}

	public void setOthermoney(String othermoney) {
		this.othermoney = othermoney;
	}

	public String getTips() {
		return this.tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public String getService() {
		return this.service;
	}

	public void setService(String service) {
		this.service = service;
	}


	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

}