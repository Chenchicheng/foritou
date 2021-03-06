package cn.foritou.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Shop entity. @author MyEclipse Persistence Tools
 */

public class Shop implements java.io.Serializable {
	// Fields

	private Integer id;
	private String name;
	private Shoptype shoptype;
	private String phone;
	private String describle;
	private String password;
	private Double coefficient;
	private Double price;
	private Timestamp date;
	private Integer hot;
    private String email;
    private String other;//其他联系方式
    private Integer zhizhao;//是否有营业执照
    private String city;//城市
    private String area;//区域
    private String shangquan;//商圈
    private String address;//地址
    private String addressmap;//地图上显示的地址
    private String  telephone;
    private String contactname;//联系人姓名
    private String miaoshu;//商家描述
    private Set<Shopimage> imageSet=new HashSet<Shopimage>();
    private Set<Discount>   discountSet=new HashSet<Discount>();
    private Set<Store> storeSet=new HashSet<Store>();
    private Set<Usernotes> usernotesSet=new HashSet<Usernotes>();
    private Set<Score> scoreSet=new HashSet<Score>();
	// Constructors

	/** default constructor */
	public Shop() {
	}
  public Shop(Integer id){
	  super();
	  this.id=id;
  }
  public Shop(Set<Shopimage> imageSet){
	  super();
	  this.imageSet=imageSet;
  }
  

	/** full constructor */
	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public Shop(Integer id, String name, Shoptype shoptype, String phone,
			String describle, String password, Double coefficient, Double price,
			Timestamp date, Integer hot, String email, String other,
			Integer zhizhao, String city, String area, String shangquan,
			String address, String addressmap, String telephone,String contactname,String miaoshu) {
		super();
		this.id = id;
		this.name = name;
		this.shoptype = shoptype;
		this.phone = phone;
		this.describle = describle;
		this.password = password;
		this.coefficient = coefficient;
		this.price = price;
		this.date = date;
		this.hot = hot;
		this.email = email;
		this.other = other;
		this.zhizhao = zhizhao;
		this.city = city;
		this.area = area;
		this.shangquan = shangquan;
		this.address = address;
		this.addressmap = addressmap;
		this.telephone = telephone;
		this.contactname=contactname;
		this.miaoshu=miaoshu;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public Shoptype getShoptype() {
		return shoptype;
	}

	public void setShoptype(Shoptype shoptype) {
		this.shoptype = shoptype;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDescrible() {
		return this.describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public Double getCoefficient() {
		return coefficient;
	}
	public void setCoefficient(Double coefficient) {
		this.coefficient = coefficient;
	}
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Integer getHot() {
		return hot;
	}
	public void setHot(Integer hot) {
		this.hot = hot;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getOther() {
		return other;
	}


	public void setOther(String other) {
		this.other = other;
	}





	public Integer getZhizhao() {
		return zhizhao;
	}


	public void setZhizhao(Integer zhizhao) {
		this.zhizhao = zhizhao;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public String getShangquan() {
		return shangquan;
	}


	public void setShangquan(String shangquan) {
		this.shangquan = shangquan;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getAddressmap() {
		return addressmap;
	}


	public void setAddressmap(String addressmap) {
		this.addressmap = addressmap;
	}


	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getContactname() {
		return contactname;
	}


	public void setContactname(String contactname) {
		this.contactname = contactname;
	}


	public String getMiaoshu() {
		return miaoshu;
	}


	public void setMiaoshu(String miaoshu) {
		this.miaoshu = miaoshu;
	}
	public Set<Shopimage> getImageSet() {
		return imageSet;
	}
	public void setImageSet(Set<Shopimage> imageSet) {
		this.imageSet = imageSet;
	}
	public Set<Discount> getDiscountSet() {
		return discountSet;
	}
	public void setDiscountSet(Set<Discount> discountSet) {
		this.discountSet = discountSet;
	}
	public Set<Store> getStoreSet() {
		return storeSet;
	}
	public void setStoreSet(Set<Store> storeSet) {
		this.storeSet = storeSet;
	}
	public Set<Usernotes> getUsernotesSet() {
		return usernotesSet;
	}
	public void setUsernotesSet(Set<Usernotes> usernotesSet) {
		this.usernotesSet = usernotesSet;
	}
	public Set<Score> getScoreSet() {
		return scoreSet;
	}
	public void setScoreSet(Set<Score> scoreSet) {
		this.scoreSet = scoreSet;
	}


	
}