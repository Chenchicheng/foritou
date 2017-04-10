package cn.foritou.action;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.foritou.model.Score;
import cn.foritou.model.ScoreData;
import cn.foritou.model.Shop;
import cn.foritou.model.Usernotes;
import cn.foritou.service.ScoreService;
@Controller
@Scope("prototype")
public class UsernotesAction extends BaseAction<Usernotes> {

public String update(){
	try {
		usernotesService.update(model);
		session.put("usernotes", usernotesService.querybySid(model.getShop().getId()));
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "usernotes";
	
}
}
