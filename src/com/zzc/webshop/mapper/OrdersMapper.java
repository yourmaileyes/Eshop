package com.zzc.webshop.mapper;


import java.util.List;

import com.zzc.webshop.entity.Orders;

public interface OrdersMapper {
	List<Orders> select(String orderid);
    int insert(Orders record);

    int insertSelective(Orders record);
}