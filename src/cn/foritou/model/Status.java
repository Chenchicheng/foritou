package cn.foritou.model;

/**
 * Status entity. @author MyEclipse Persistence Tools
 */

public class Status implements java.io.Serializable {

	// Fields

	private Integer id;
	private String status;

	// Constructors

	/** default constructor */
	public Status() {
	}

	/** full constructor */
	public Status(Integer id) {
		super();
		this.id=id;
	}
	public Status(String status) {
		super();
		this.status = status;
	}

	// Property accessors

	public Status(Integer id, String status) {
		super();
		this.id = id;
		this.status = status;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}