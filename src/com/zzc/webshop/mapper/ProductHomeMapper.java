package com.zzc.webshop.mapper;


import java.util.List;
import java.util.Map;

import com.zzc.webshop.entity.ProductHome;

public interface ProductHomeMapper {
	String selectnumber(String userid);
	int deleteByPrimaryKey(Map map);
	ProductHome selectproduct(Map map);
	List<ProductHome> selectall(String userid);
	int updateByPrimaryKey(ProductHome record);
    int insert(ProductHome record);

    int insertSelective(ProductHome record);
}