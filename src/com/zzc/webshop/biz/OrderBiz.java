package com.zzc.webshop.biz;

import java.util.List;

import com.zzc.webshop.entity.Order;

public interface OrderBiz {
	Order selectorderbyorderid(String orderid);
	List<Order> selectorder(String userid);
	int insertSelective(Order record);
	int insert(Order record);
	List<Order> selectallorder();
	int updateByPrimaryKeySelective(Order record);
}
