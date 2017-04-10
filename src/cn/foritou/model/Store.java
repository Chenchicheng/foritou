package cn.foritou.model;

/**
 * Store entity. @author MyEclipse Persistence Tools
 */

public class Store implements java.io.Serializable {

	// Fields

	private Integer id;
	private String phone;
	private String adress;
	private Shop shop;
	private String info;
	private String addressmap;

	// Constructors

	/** default constructor */
	public Store() {
	}

	/** full constructor */
	public Store(String phone, String adress,Shop shop,String info,String addressmap) {
		this.phone = phone;
		this.adress = adress;
		this.shop=shop;
		this.info=info;
		this.addressmap=addressmap;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAdress() {
		return this.adress;
	}
	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getAddressmap() {
		return addressmap;
	}

	public void setAddressmap(String addressmap) {
		this.addressmap = addressmap;
	}



}