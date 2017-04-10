package cn.foritou.model;

/**
 * Size entity. @author MyEclipse Persistence Tools
 */

public class Size implements java.io.Serializable {

	// Fields

	private Integer id;
	private String size;

	// Constructors

	/** default constructor */
	public Size() {
	}

	/** full constructor */
	public Size(String size) {
		this.size = size;
	}
	public Size(Integer id) {
		this.id=id;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSize() {
		return this.size;
	}

	public void setSize(String size) {
		this.size = size;
	}

}