package cn.foritou.model;



/**
 * Average entity. @author MyEclipse Persistence Tools
 */

public class Average  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private Integer tid;
     private Double store;
     private Double score;
     private Double collection;
     private Double comment;
     private Double sale;
     private Double comsumption;


    // Constructors

    /** default constructor */
    public Average() {
    }

    
    /** full constructor */
    public Average(Integer tid, Double store, Double score, Double collection, Double comment, Double sale, Double comsumption) {
        this.tid = tid;
        this.store = store;
        this.score = score;
        this.collection = collection;
        this.comment = comment;
        this.sale = sale;
        this.comsumption = comsumption;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTid() {
        return this.tid;
    }
    
    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Double getStore() {
        return this.store;
    }
    
    public void setStore(Double store) {
        this.store = store;
    }

    public Double getScore() {
        return this.score;
    }
    
    public void setScore(Double score) {
        this.score = score;
    }

    public Double getCollection() {
        return this.collection;
    }
    
    public void setCollection(Double collection) {
        this.collection = collection;
    }

    public Double getComment() {
        return this.comment;
    }
    
    public void setComment(Double comment) {
        this.comment = comment;
    }

    public Double getSale() {
        return this.sale;
    }
    
    public void setSale(Double sale) {
        this.sale = sale;
    }

    public Double getComsumption() {
        return this.comsumption;
    }
    
    public void setComsumption(Double comsumption) {
        this.comsumption = comsumption;
    }
   








}