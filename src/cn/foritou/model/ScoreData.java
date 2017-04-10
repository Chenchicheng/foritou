package cn.foritou.model;

/**
 * Company entity. @author MyEclipse Persistence Tools
 */

public class ScoreData implements java.io.Serializable {
private double aveScore;//评分
private long count;//评价人数
private long collector;//收藏者数量
public ScoreData(double aveScore, long count, long collector) {
	super();
	this.aveScore = aveScore;
	this.count = count;
	this.collector = collector;
}
public double getAveScore() {
	return aveScore;
}
public void setAveScore(double aveScore) {
	this.aveScore = aveScore;
}
public long getCount() {
	return count;
}
public void setCount(long count) {
	this.count = count;
}
public long getCollector() {
	return collector;
}
public void setCollector(long collector) {
	this.collector = collector;
}

}