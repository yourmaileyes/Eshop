package com.zzc.webshop.mapper;


import java.util.List;

import com.zzc.webshop.entity.Product;

public interface ProductMapper {
	String selectlastproductid();
	List<Product> selectname(String name);
	List<Product> selectall();
    int deleteByPrimaryKey(Integer productid);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productid);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
}