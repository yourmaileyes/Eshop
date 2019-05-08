package com.zzc.webshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzc.webshop.entity.Message;
import com.zzc.webshop.entity.Order;
import com.zzc.webshop.entity.Product;
import com.zzc.webshop.entity.User;
import com.zzc.webshop.util.DateUtil;
import com.zzc.webshop.biz.MessageBiz;
import com.zzc.webshop.biz.OrderBiz;
import com.zzc.webshop.biz.ProductBiz;
import com.zzc.webshop.biz.UserBiz;

@Controller
public class UserController {
	@Autowired
	UserBiz userBiz;
	@Autowired
	ProductBiz productBiz;
	@Autowired
	OrderBiz orderBiz;
	@Autowired
	MessageBiz messageBiz;
	@RequestMapping(value = "login")//登录
	public String login(User user, HttpSession session) {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", user.getUsername());
		paramMap.put("password", user.getPassword());
		User loginUser = userBiz.selectLoginUser(paramMap);
		if (loginUser == null) {
			return "redirect:products.do";
		}
		if(loginUser.getType()!=null&&loginUser.getType().equals("seller")) {
			session.setAttribute("loginUser", loginUser);
			List<Product> products = productBiz.selectall();
			List<Order> orders = orderBiz.selectallorder();
			int allnumber=orders.size();
			int notnumber=0;
			for(Order order:orders) {
				if(order.getType()==0) {
					notnumber++;
				}
			}
			session.setAttribute("allnumber", allnumber);
			session.setAttribute("notnumber", notnumber);
			session.setAttribute("products", products);
			return "pages/sellerindex";
		}
		if(loginUser.getType()!=null&&loginUser.getType().equals("admin")) {
			session.setAttribute("loginUser", loginUser);
			return "pages/sellerindex";
		}
		List<Message> messages = messageBiz.selectmessage(loginUser.getUserid());
		for(Message message:messages) {
			if(message.getType().equals("0"))
				session.setAttribute("isnew", true);
		}
		session.setAttribute("loginUser", loginUser);
		return "redirect:products.do";
	}
	@RequestMapping(value = "quickpasswordchat")//登录密码检测
	public void quickpasswordchat(User user, HttpSession session,HttpServletResponse response) throws IOException {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", user.getUsername());
		paramMap.put("password", user.getPassword());
		User loginUser = userBiz.selectLoginUser(paramMap);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if (loginUser == null) {
			out.print(0);
		}else{
			out.print(1);
		}
	}
	
	@RequestMapping(value = "regist")//注册
	public String regist(User user, HttpSession session) {
		user.setUserid(DateUtil.getId());
		user.setCollect(0);
		userBiz.insertSelective(user);
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("username", user.getUsername());
		paramMap.put("password", user.getPassword());
		User loginUser = userBiz.selectLoginUser(paramMap);
		session.setAttribute("loginUser", loginUser);
		return "redirect:products.do";
	}
	@RequestMapping(value = "sellerregist")//商户注册
	public String sellerregist(User user, HttpSession session) {
		User user1 = userBiz.selectusername(user.getUsername());
		if(user1!=null) {
			session.setAttribute("registMsg", "用户名已存在！");
			return "regist";
		}
		user.setUserid(DateUtil.getId());
		user.setType("seller");
		userBiz.insertSelective(user);
		return "redirect:index.do";
	}
	@RequestMapping(value = "logout")//登出、注销
	public String logout(User user, HttpSession session) {
		session.invalidate();
		return "redirect:index.do";
	}
	@RequestMapping(value = "quickusernamechat")//注册用户名检查
	public void quickusernamechat(String username, HttpSession session,HttpServletResponse response) throws IOException {
		User loginUser = (User) session.getAttribute("loginUser");
		User user = userBiz.selectusername(username);
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		if(loginUser!=null){
		if (user == null||loginUser.getUsername().equals(username)) {
			out.print(0);
		}else{
			out.print(1);
		}
		}else{
			if (user == null) {
				out.print(0);
			}else{
				out.print(1);
			}
		}
	}
	@RequestMapping(value = "info")//信息展示
	public String info(int type, HttpSession session) {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		if(type==0){
		    return "pages/infomation";
		}
		if(type==1){
			return "pages/passwordset";
		}
		if(type==2){
			return "redirect:showorder.do";
		}
		return "pages/infomation";
	}
	@RequestMapping(value = "infoset")//信息更新
	public String infoset(User user, HttpSession session) {
		userBiz.updateByPrimaryKeySelective(user);
		session.removeAttribute("loginUser");
		return "pages/computers";
	}
	@RequestMapping(value="alluser")
	public String alluser(HttpSession session) {
		List<User> userList = userBiz.showuser();
		session.setAttribute("userList", userList);
		return "pages/allser";
	}
	@RequestMapping(value="balance")//余额充值
	public String balance(String username,String num,HttpSession session) {
		User user = userBiz.selectusername(username);
		if(user==null) {
			session.setAttribute("bmsg", "没有该用户!");
			return "balance";
		}
		user.setCollect(user.getCollect()+Integer.valueOf(num));
		userBiz.updateByPrimaryKeySelective(user);
		session.setAttribute("bmsg", "充值成功!");
		return "balance";
	}
}
