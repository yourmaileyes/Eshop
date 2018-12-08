package com.zzc.webshop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzc.webshop.biz.MessageBiz;
import com.zzc.webshop.entity.Message;
import com.zzc.webshop.entity.User;

@Controller
public class MessageController {
	@Autowired
	MessageBiz messageBiz;
	@RequestMapping(value="talk")
	public String talk(HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Message> messages = messageBiz.selectmessage(loginUser.getUserid());
		session.setAttribute("messages", messages);
		messageBiz.updatereadmessage(loginUser.getUserid());//已读操作
		return "pages/talk";
	}
	@RequestMapping(value="sellertalk")
	public String sellertalk(HttpSession session,String messagefromid) {
		if(messagefromid==null) {
			List<Message> messages = messageBiz.selectallmessage();
			Map<String,Boolean> pmap = new HashMap<>();
			for(Message message:messages) {
				String fromid = message.getFromid();
				pmap.put(fromid, false);
				if(message.getType().equals("0")) {
					pmap.put(fromid, true);
				}
			}
			session.setAttribute("users", pmap.keySet());
			session.setAttribute("usersmap", pmap);
			return "pages/sellertalk";
		}
		messageBiz.updatereadmessage(messagefromid);//已读操作
		List<Message> messages = messageBiz.selectmessage(messagefromid);
		session.setAttribute("messages", messages);
		session.setAttribute("messagefromid", messagefromid);
		return "pages/sellertalk";
	}
	@RequestMapping(value="talksend")
	public String talksend(Message message,HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null) {
			return "redirect:";
		}
		message.setType("0");//代表未读
		messageBiz.insertSelective(message);
		if(loginUser.getType()!=null&&loginUser.getType().equals("seller")) {
			return "redirect:sellertalk.do?messagefromid="+message.getToid();
		}
		return "redirect:talk.do";
	}

}
