package cn.foritou.model;

/**
 * Related entity. @author MyEclipse Persistence Tools
 */

public class Related implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer sid;
	private Integer cid;
	private Integer discountid;
	private Double discount;
	private Double degree;

	// Constructors

	/** default constructor */
	public Related() {
	}

	/** full constructor */
	public Related(Integer sid, Integer cid, Integer discountid,
			Double discount, Double degree) {
		this.sid = sid;
		this.cid = cid;
		this.discountid = discountid;
		this.discount = discount;
		this.degree = degree;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getDiscountid() {
		return this.discountid;
	}

	public void setDiscountid(Integer discountid) {
		this.discountid = discountid;
	}

	public Double getDiscount() {
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Double getDegree() {
		return this.degree;
	}

	public void setDegree(Double degree) {
		this.degree = degree;
	}

}