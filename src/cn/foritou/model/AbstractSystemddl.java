package cn.foritou.model;

/**
 * AbstractSystemddl entity provides the base persistence definition of the
 * Systemddl entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractSystemddl implements java.io.Serializable {

	// Fields

	private Integer seqId;
	private String ddlCode;
	private String ddlName;
	private String keyCode;
    private String ddlName2;
	// Constructors

	/** default constructor */
	public AbstractSystemddl() {
	}

	/** full constructor */
	public AbstractSystemddl(String ddlCode,String ddlName2, String ddlName, String keyCode) {
		this.ddlCode = ddlCode;
		this.ddlName = ddlName;
		this.keyCode = keyCode;
		this.ddlName2=ddlName2;
	}

	// Property accessors

	public String getDdlName2() {
		return ddlName2;
	}

	public void setDdlName2(String ddlName2) {
		this.ddlName2 = ddlName2;
	}

	public Integer getSeqId() {
		return this.seqId;
	}

	public void setSeqId(Integer seqId) {
		this.seqId = seqId;
	}

	public String getDdlCode() {
		return this.ddlCode;
	}

	public void setDdlCode(String ddlCode) {
		this.ddlCode = ddlCode;
	}

	public String getDdlName() {
		return this.ddlName;
	}

	public void setDdlName(String ddlName) {
		this.ddlName = ddlName;
	}

	public String getKeyCode() {
		return this.keyCode;
	}

	public void setKeyCode(String keyCode) {
		this.keyCode = keyCode;
	}

}