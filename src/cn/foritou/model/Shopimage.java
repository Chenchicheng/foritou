package cn.foritou.model;

/**
 * Shopimage entity. @author MyEclipse Persistence Tools
 */

public class Shopimage implements java.io.Serializable {

	// Fields

	private Integer id;
	private String type;
	private String href;
	private Shop shop;
    private String info;
	// Constructors

	/** default constructor */
	public Shopimage() {
	}

	/** full constructor */
	public Shopimage(String type, String href,Shop shop,String info) {
		this.type = type;
		this.href = href;
	    this.shop=shop;
		this.info=info;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getHref() {
		return this.href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}



}