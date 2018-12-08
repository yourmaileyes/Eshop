package com.zzc.webshop.biz;

import java.util.List;
import java.util.Map;

import com.zzc.webshop.entity.ProductHome;

public interface ProductHomeBiz {
	String selectnumber(String userid);
	int deleteByPrimaryKey(Map map);
	ProductHome selectproduct(Map map);
	List<ProductHome> selectall(String userid);
	int updateByPrimaryKey(ProductHome record);
	int insertSelective(ProductHome record);
}
