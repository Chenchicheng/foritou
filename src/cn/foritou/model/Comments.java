package cn.foritou.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import com.sun.org.apache.xerces.internal.impl.dv.xs.DecimalDV;

/**
 * Comments entity. @author MyEclipse Persistence Tools
 */

public class Comments implements java.io.Serializable {

	// Fields

	private Integer id;
	private Employee employee;
	private Shop shop;
	private Timestamp date;
	private String comment;
	private String reply;
	private BigDecimal state;

	// Constructors

	/** default constructor */
	public Comments() {
	}

	/** full constructor */
	public Comments(Employee employee,Shop shop, String comment,String reply,Timestamp date,BigDecimal state) {
		this.employee=employee;
		this.shop=shop;
		this.date = date;
		this.comment = comment;
		this.state = state;
		this.reply=reply;
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

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public BigDecimal getState() {
		return this.state;
	}

	public void setState(BigDecimal state) {
		this.state = state;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

}