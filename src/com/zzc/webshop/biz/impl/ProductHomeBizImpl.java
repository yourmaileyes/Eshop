package com.zzc.webshop.biz.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.biz.ProductHomeBiz;
import com.zzc.webshop.entity.ProductHome;
import com.zzc.webshop.mapper.ProductHomeMapper;
@Service(value="ProductHomeBiz")
public class ProductHomeBizImpl implements ProductHomeBiz{
	@Autowired
	ProductHomeMapper productHomeMapper;

	@Override
	public List<ProductHome> selectall(String userid) {
		// TODO Auto-generated method stub
		return productHomeMapper.selectall(userid);
	}

	@Override
	public ProductHome selectproduct(Map map) {
		// TODO Auto-generated method stub
		return productHomeMapper.selectproduct(map);
	}

	@Override
	public int updateByPrimaryKey(ProductHome record) {
		// TODO Auto-generated method stub
		return productHomeMapper.updateByPrimaryKey(record);
	}

	@Override
	public int insertSelective(ProductHome record) {
		// TODO Auto-generated method stub
		return productHomeMapper.insertSelective(record);
	}

	@Override
	public int deleteByPrimaryKey(Map map) {
		// TODO Auto-generated method stub
		return productHomeMapper.deleteByPrimaryKey(map);
	}

	@Override
	public String selectnumber(String userid) {
		// TODO Auto-generated method stub
		return productHomeMapper.selectnumber(userid);
	}

}
