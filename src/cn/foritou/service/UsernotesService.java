package cn.foritou.service;


import cn.foritou.model.Usernotes;

public interface UsernotesService extends BaseService<Usernotes>{
public Usernotes querybySid(int sid);
}
