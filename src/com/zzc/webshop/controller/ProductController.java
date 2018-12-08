package com.zzc.webshop.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zzc.webshop.biz.ProductBiz;
import com.zzc.webshop.biz.ProductHomeBiz;
import com.zzc.webshop.entity.Product;
import com.zzc.webshop.entity.ProductHome;
import com.zzc.webshop.entity.User;
import com.zzc.webshop.util.UploadFile;

@Controller
public class ProductController {
	@Autowired
	ProductBiz productBiz;
	@Autowired
	ProductHomeBiz productHomeBiz;

	@RequestMapping(value = "index") // 展示全部商品
	public String index(HttpSession session, Map map) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Product> products = productBiz.selectall();
		List<Product> dayproducts = new ArrayList<>();
		Date date = new Date();
		for (Product pro : products) {// 添加每日精选商品
			if ((pro.getProductid() % 10) == (date.getDate() % 10)) {
				dayproducts.add(pro);
				if (dayproducts.size() == 3) {// 根据商品id最后一位对应每天日期的最后一位，只添加三个每日推荐
					break;
				}
			}

		}
		session.setAttribute("dayproducts", dayproducts);
		if (loginUser != null) {
			String i = productHomeBiz.selectnumber(loginUser.getUserid());
			if (i != null) {
				map.put("cartnumber", i);
			}
		}
		return "pages/index";
	}

	@RequestMapping(value = "products") // 展示全部商品
	public String products(HttpSession session, Map map) {
		User loginUser = (User) session.getAttribute("loginUser");
		List<Product> products = productBiz.selectall();
		session.setAttribute("products", products);
		if (loginUser != null) {
			String i = productHomeBiz.selectnumber(loginUser.getUserid());
			map.put("cartnumber", i);
		}
		map.remove("name");
		return "pages/computers";
	}

	@RequestMapping(value = "productdetail") // 展示商品细节
	public String productdetail(HttpSession session, int productid) {
		Product product = productBiz.selectByPrimaryKey(productid);
		session.setAttribute("product", product);
		return "pages/computer";
	}

	@RequestMapping(value = "productsucah") // 搜索商品
	public String productsucah(HttpSession session, String name) {
		List<Product> products = productBiz.selectname(name);
		session.setAttribute("products", products);
		session.setAttribute("name", name);
		return "pages/computers";
	}

	@RequestMapping(value = "sellerproduct") // 卖家维护的信息页面提供商品信息
	public String sellerproduct(HttpSession session, Map map) {
		List<Product> products = productBiz.selectall();
		session.setAttribute("products", products);
		return "pages/sellermin";
	}

	@RequestMapping(value = "sellerdetails") // 卖家上架商品信息，提供商品详细信息
	public String sellerdetails(HttpSession session, String productid) {
		if (productid == null) {
			session.removeAttribute("msg");
			session.removeAttribute("product");
			return "pages/sellerdetails";
		}
		session.removeAttribute("msg");
		int id = Integer.valueOf(productid);
		Product product = productBiz.selectByPrimaryKey(id);
		session.setAttribute("product", product);
		return "pages/sellerdetails";
	}

	@RequestMapping(value = "sellerdetailsupdata") // 卖家上架商品，修改商品详细信息
	public String sellerdetailsupdata(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		Product product = new Product();
		product = UploadFile.uploadFile(productBiz.selectlastproductid(), req, resp);
		if (product.getTtype() == null) {
			productBiz.insertSelective(product);
			session.setAttribute("product", product);
			session.setAttribute("msg", "上架成功！");
			return "pages/sellerdetails";
		} else {
			productBiz.updateByPrimaryKeySelective(product);
			session.setAttribute("product", product);
			session.setAttribute("msg", "修改成功！");
			return "pages/sellerdetails";
		}
	}
}
