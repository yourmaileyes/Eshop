package com.zzc.webshop.biz;

import java.util.List;

import com.zzc.webshop.entity.Orders;

public interface OrdersBiz {
	List<Orders> select(String orderid);
	int insert(Orders record);
}
