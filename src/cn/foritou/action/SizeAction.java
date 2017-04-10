package cn.foritou.action;

import java.io.ByteArrayInputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Shop;
import cn.foritou.model.Shopimage;
import cn.foritou.model.Size;
import cn.foritou.model.Store;

@Controller
@Scope("prototype")
public class SizeAction extends BaseAction<Size>{
	public String query(){
	jsonList=sizeService.query();
	return "jsonList";
	}
}
