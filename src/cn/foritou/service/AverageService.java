package cn.foritou.service;

import cn.foritou.model.Average;

public interface AverageService extends BaseService<Average>{
public Average queryByTid(int tid);
}
