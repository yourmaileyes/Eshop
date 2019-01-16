package com.zzc.webshop.biz.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.mapper.UserMapper;
import com.zzc.webshop.biz.UserBiz;
import com.zzc.webshop.entity.User;
@Service(value="UserBiz")
public class UserBizImpl implements UserBiz{
	@Autowired
    UserMapper userMapper;
	@Override
	public User selectLoginUser(Map map) {
		// TODO Auto-generated method stub
		return userMapper.selectLoginUser(map);
	}
	@Override
	public User selectusername(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectusername(username);
	}
	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public User selectByPrimaryKey(String userid) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(userid);
	}
	@Override
	public List<User> showuser() {
		// TODO Auto-generated method stub
		return userMapper.showuser();
	}

}
