package cn.foritou.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Companytype entity. @author MyEclipse Persistence Tools
 */

public class Companytype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String industry;
    private Set<Company> companySet=new HashSet<Company>();
	// Constructors

	/** default constructor */
	public Companytype() {
	}

	/** full constructor */
	public Companytype(String name, String industry) {
		this.name = name;
	this.industry=industry;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
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

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public Set<Company> getCompanySet() {
		return companySet;
	}

	public void setCompanySet(Set<Company> companySet) {
		this.companySet = companySet;
	}


	

}