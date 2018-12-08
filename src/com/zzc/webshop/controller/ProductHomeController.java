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

import com.zzc.webshop.biz.ProductHomeBiz;
import com.zzc.webshop.entity.Product;
import com.zzc.webshop.entity.ProductHome;
import com.zzc.webshop.entity.User;

@Controller
public class ProductHomeController {
	@Autowired
	ProductHomeBiz productHomeBiz;
	@RequestMapping(value = "cart.do")//展示购物车
	public String cart(HttpSession session,Map map) {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		List<ProductHome> productHomes = productHomeBiz.selectall(loginUser.getUserid());
		if(productHomes.size()==0){
			return "pages/emptycart";
		}
		int totoprice = 0;
		for(ProductHome producthome:productHomes){
			totoprice+=producthome.getPrice();
		}
		String i = productHomeBiz.selectnumber(loginUser.getUserid());
		map.put("cartnumber", i);
		map.put("productHomes", productHomes);
		map.put("totoprice", totoprice);
		return "pages/cart";
	}
	@RequestMapping(value = "addcart.do")//加入购物车
	public void addcart(ProductHome productHome,HttpSession session,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			out.print("请登录后再操作~~~~,现在注册就送500元，快来注册吧");
			return;
		}
		Map rmap = new HashMap<String, String>();
		rmap.put("userid", loginUser.getUserid());
		rmap.put("productid", productHome.getProductid());
		ProductHome producth = productHomeBiz.selectproduct(rmap);
		if(producth!=null){
			producth.setNumber(producth.getNumber()+1);
			producth.setPrice(producth.getPrice()+productHome.getPrice());
			productHomeBiz.updateByPrimaryKey(producth);
		}else{
			productHome.setUserid(loginUser.getUserid());
			productHome.setNumber(1);
			productHomeBiz.insertSelective(productHome);
		}
		out.print("添加成功！！！");
	}
	@RequestMapping(value = "delectcart.do")//删除购物车单项
	public String delectcart(HttpSession session,String productid){
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		Map rmap = new HashMap<String, String>();
		rmap.put("userid", loginUser.getUserid());
		rmap.put("productid", productid);
        productHomeBiz.deleteByPrimaryKey(rmap);
		return "redirect:cart.do";
	}
	@RequestMapping(value = "clearcart.do")//清空购物车
	public String clearcart(HttpSession session) throws IOException {
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		Map rmap = new HashMap<String, String>();
		rmap.put("userid", loginUser.getUserid());
        productHomeBiz.deleteByPrimaryKey(rmap);
		return "redirect:cart.do";
	}
	@RequestMapping(value = "cashcart.do")//购物车结账
	public String cashcart(HttpSession session,Map map){
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser==null){
			return "redirect:products.do";
		}
		List<ProductHome> productHomes = productHomeBiz.selectall(loginUser.getUserid());
		if(productHomes.size()==0){
			return "pages/emptycart";
		}
		int totoprice = 0;
		for(ProductHome producthome:productHomes){
			totoprice+=producthome.getPrice();
		}
		map.put("cartnumber", productHomes.size());
		map.put("totoprice", totoprice);
		return "pages/cash";
	}
}
