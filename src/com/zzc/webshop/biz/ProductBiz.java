package com.zzc.webshop.biz;

import java.util.List;

import com.zzc.webshop.entity.Product;

public interface ProductBiz {
	String selectlastproductid();
	List<Product> selectall();
	Product selectByPrimaryKey(Integer productid);
	List<Product> selectname(String name);
	int updateByPrimaryKeySelective(Product record);
	int insertSelective(Product record);
}
