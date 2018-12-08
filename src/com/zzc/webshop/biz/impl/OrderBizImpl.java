package com.zzc.webshop.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.biz.OrderBiz;
import com.zzc.webshop.entity.Order;
import com.zzc.webshop.mapper.OrderMapper;
@Service(value="OrderBiz")
public class OrderBizImpl implements OrderBiz{
	@Autowired
	OrderMapper orderMapper;

	@Override
	public int insertSelective(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.insertSelective(record);
	}

	@Override
	public int insert(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.insert(record);
	}

	@Override
	public List<Order> selectorder(String userid) {
		// TODO Auto-generated method stub
		return orderMapper.selectorder(userid);
	}

	@Override
	public Order selectorderbyorderid(String orderid) {
		// TODO Auto-generated method stub
		return orderMapper.selectorderbyorderid(orderid);
	}

	@Override
	public List<Order> selectallorder() {
		// TODO Auto-generated method stub
		return orderMapper.selectallorder();
	}

	@Override
	public int updateByPrimaryKeySelective(Order record) {
		// TODO Auto-generated method stub
		return orderMapper.updateByPrimaryKeySelective(record);
	}

}
