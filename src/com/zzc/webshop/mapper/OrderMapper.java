package com.zzc.webshop.mapper;


import java.util.List;

import com.zzc.webshop.entity.Order;

public interface OrderMapper {
Order selectorderbyorderid(String orderid);
	
	List<Order> selectorder(String userid);
	List<Order> selectallorder();
    int deleteByPrimaryKey(String orderid);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(String orderid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}