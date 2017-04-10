package cn.foritou.model;

/**
 * Systemddl entity. @author MyEclipse Persistence Tools
 */
public class Systemddl extends AbstractSystemddl implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public Systemddl() {
	}

	/** full constructor */
	public Systemddl(String ddlCode, String ddlName2,String ddlName, String keyCode) {
		super(ddlCode,ddlName2, ddlName, keyCode);
	}

}
