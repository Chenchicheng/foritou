package cn.foritou.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Forder entity. @author MyEclipse Persistence Tools
 */

public class Forder implements java.io.Serializable {

	// Fields

	private Integer id;
	private Company company;
	private Timestamp date;
	private BigDecimal total;
	private Status status;
    private Set<Sorder> sorderSet=new HashSet<Sorder>();
	// Constructors

	/** default constructor */
	public Forder() {
	}
	

	public Forder(Set<Sorder> sorderSet) {
		super();
		this.sorderSet = sorderSet;
	}


	/** full constructor */

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public Forder(Company company, Timestamp date, BigDecimal total,
			Status status) {
		super();
		this.company = company;
		this.date = date;
		this.total = total;
		this.status = status;
	}

	public void setId(Integer id) {
		this.id = id;
	}



	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}


	public Company getCompany() {
		return company;
	}


	public void setCompany(Company company) {
		this.company = company;
	}


	public BigDecimal getTotal() {
		return total;
	}


	public void setTotal(BigDecimal total) {
		this.total = total;
	}


	public Status getStatus() {
		return status;
	}


	public void setStatus(Status status) {
		this.status = status;
	}


	public Set<Sorder> getSorderSet() {
		return sorderSet;
	}


	public void setSorderSet(Set<Sorder> sorderSet) {
		this.sorderSet = sorderSet;
	}



}