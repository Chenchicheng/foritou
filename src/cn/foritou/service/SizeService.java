package cn.foritou.service;

import cn.foritou.model.Size;

public interface SizeService extends BaseService<Size>{
	//根据数量获得规模
public Size getSize(int number);
	
}
