package cn.foritou.model;

/**
 * Shoptype entity. @author MyEclipse Persistence Tools
 */

public class Shoptype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String typename;
    private String  pic;
	// Constructors

	/** default constructor */
	public Shoptype() {
	}

	/** full constructor */
	public Shoptype(int id) {
	this.id=id;
	}
	
	public Shoptype(String typename) {
		
		this.typename = typename;
	}
	

	public Shoptype(String typename, String pic) {
		super();
		this.typename = typename;
		this.pic = pic;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypename() {
		return this.typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}