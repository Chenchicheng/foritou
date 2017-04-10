package cn.foritou.model;

/**
 * State entity. @author MyEclipse Persistence Tools
 */

public class State implements java.io.Serializable {

	// Fields

	private Integer id;
	private String state;

	// Constructors

	/** default constructor */
	public State() {
	}

	/** full constructor */
	public State(String state) {
		this.state = state;
	}
	public State(Integer id) {
	
		this.id=id;
	}
	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

}