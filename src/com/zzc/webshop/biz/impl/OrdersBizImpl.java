package com.zzc.webshop.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.biz.OrdersBiz;
import com.zzc.webshop.entity.Orders;
import com.zzc.webshop.mapper.OrdersMapper;
@Service(value="OrdersBiz")
public class OrdersBizImpl implements OrdersBiz {
@Autowired
OrdersMapper ordersMapper;
	@Override
	public List<Orders> select(String orderid) {
		// TODO Auto-generated method stub
		return ordersMapper.select(orderid);
	}
	@Override
	public int insert(Orders record) {
		// TODO Auto-generated method stub
		return ordersMapper.insert(record);
	}

}
