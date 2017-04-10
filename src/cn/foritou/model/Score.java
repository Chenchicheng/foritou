package cn.foritou.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Score entity. @author MyEclipse Persistence Tools
 */

public class Score implements java.io.Serializable {

	// Fields

	private Integer id;
	private Employee employee;
	private Shop shop;
	private Timestamp date;
	private Double scorenumber;

	// Constructors

	/** default constructor */
	public Score() {
	}

	/** full constructor */
	public Score(Employee employee,Shop shop, Timestamp date, Double scorenumber) {
		this.employee=employee;
		this.shop=shop;
		this.date = date;
		this.scorenumber = scorenumber;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Double getScorenumber() {
		return this.scorenumber;
	}

	public void setScorenumber(Double scorenumber) {
		this.scorenumber = scorenumber;
	}

}