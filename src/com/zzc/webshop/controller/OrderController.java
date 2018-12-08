package com.zzc.webshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzc.webshop.biz.OrderBiz;
import com.zzc.webshop.biz.OrdersBiz;
import com.zzc.webshop.biz.ProductHomeBiz;
import com.zzc.webshop.biz.UserBiz;
import com.zzc.webshop.entity.Order;
import com.zzc.webshop.entity.Orders;
import com.zzc.webshop.entity.ProductHome;
import com.zzc.webshop.entity.User;
import com.zzc.webshop.util.DateUtil;

@Controller
public class OrderController {
	@Autowired
	OrderBiz orderBiz;
	@Autowired
	ProductHomeBiz productHomeBiz;
	@Autowired
	UserBiz userBiz;
	@Autowired
	OrdersBiz	ordersBiz;
	@RequestMapping(value = "cash.do")//结账,生成订单
	public String cash(Order order,HttpSession session,Map map){
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		List<ProductHome> productHomes = productHomeBiz.selectall(loginUser.getUserid());
		if(productHomes.size()==0){
			return "pages/emptycart";
		}
		int totoprice = 0;
		order.setOrderid(DateUtil.getId());
		order.setUseraddr(loginUser.getAddr());
		order.setUsername(loginUser.getUsername());
		for(ProductHome producthome:productHomes){
			totoprice+=producthome.getPrice();
			Orders orders = new Orders();
			orders.setOrderid(order.getOrderid());
			orders.setProductname(producthome.getProductname());
			orders.setPrice(producthome.getPrice());
			orders.setProductid(producthome.getProductid());
			orders.setNumber(producthome.getNumber());
			ordersBiz.insert(orders);
		}
		if(loginUser.getCollect()==null){
			return "error-1";
		}
		if(loginUser.getCollect()<totoprice){
			return "error-1";
		}
		loginUser.setCollect(loginUser.getCollect()-totoprice);
		userBiz.updateByPrimaryKeySelective(loginUser);
		session.removeAttribute("loginUser");
		session.setAttribute("loginUser", loginUser);
		order.setType(0);
		order.setPrice(totoprice);
		order.setUserid(loginUser.getUserid());
		orderBiz.insert(order);
		
		map.put("cartnumber", productHomes.size());
		map.put("totoprice", totoprice);
		map.put("oriderid", order.getOrderid());
		Map rmap = new HashMap<String, String>();
		rmap.put("userid", loginUser.getUserid());
        productHomeBiz.deleteByPrimaryKey(rmap);
		return "success";
	}
	@RequestMapping(value="showorder")
	public String showorder(HttpSession session,Map map){
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		List<Order> orders = orderBiz.selectorder(loginUser.getUserid());
		map.put("orders", orders);
		return "pages/showorder";
	}
	
	@RequestMapping(value="orders")//详细订单信息
	public String orders(HttpSession session,Map map,String orderid,String type){
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		if(type!=null) {
			Order order = orderBiz.selectorderbyorderid(orderid);
			List<Orders> orderdetals = ordersBiz.select(orderid);
			map.put("orderdetals", orderdetals);
			map.put("order", order);
			return "pages/sellerordersend";
		}
		Order order = orderBiz.selectorderbyorderid(orderid);
		List<Orders> orderdetals = ordersBiz.select(orderid);
		map.put("orderdetals", orderdetals);
		map.put("order", order);
		return "pages/trades";
	}
	@RequestMapping(value="sellerorders")//所有订单信息
	public String sellerorders(HttpSession session,Map map){
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		List<Order> orders = orderBiz.selectallorder();
		map.put("orders", orders);
		return "pages/sellerorders";
	}
	@RequestMapping(value="sendproduct")//订单发货
	public void sendproduct(HttpSession session,String orderid,String tnumber,HttpServletResponse resp) throws IOException{
		Order order = orderBiz.selectorderbyorderid(orderid);
		order.setRemark(tnumber);
		order.setType(1);
		orderBiz.updateByPrimaryKeySelective(order);
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print("发货成功!");
	}
	
	@RequestMapping(value="takeproduct")//订单收货
	public void takeproduct(HttpSession session,String orderid,HttpServletResponse resp) throws IOException{
		Order order = orderBiz.selectorderbyorderid(orderid);
		order.setType(2);
		orderBiz.updateByPrimaryKeySelective(order);
		User user = userBiz.selectByPrimaryKey("201809281510201943");
		user.setCollect(user.getCollect()+order.getPrice());
		userBiz.updateByPrimaryKeySelective(user);
		resp.setCharacterEncoding("utf-8");
		PrintWriter pw = resp.getWriter();
		pw.print("收货成功!");
	}
}
