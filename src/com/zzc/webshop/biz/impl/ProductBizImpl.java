package com.zzc.webshop.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.biz.ProductBiz;
import com.zzc.webshop.entity.Product;
import com.zzc.webshop.mapper.ProductMapper;
@Service(value="ProductBiz")
public class ProductBizImpl implements ProductBiz{
    @Autowired
    ProductMapper productMapper;
	@Override
	public List<Product> selectall() {
		// TODO Auto-generated method stub
		return productMapper.selectall();
	}
	@Override
	public Product selectByPrimaryKey(Integer productid) {
		// TODO Auto-generated method stub
		return productMapper.selectByPrimaryKey(productid);
	}
	@Override
	public List<Product> selectname(String name) {
		// TODO Auto-generated method stub
		return productMapper.selectname(name);
	}
	@Override
	public int updateByPrimaryKeySelective(Product record) {
		// TODO Auto-generated method stub
		return productMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public String selectlastproductid() {
		// TODO Auto-generated method stub
		return productMapper.selectlastproductid();
	}
	@Override
	public int insertSelective(Product record) {
		// TODO Auto-generated method stub
		return productMapper.insertSelective(record);
	}

}
