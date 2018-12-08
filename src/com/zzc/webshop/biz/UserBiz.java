package com.zzc.webshop.biz;

import java.util.Map;

import com.zzc.webshop.entity.User;

public interface UserBiz {
	User selectLoginUser(Map map);
	User selectusername(String username);
	int insertSelective(User record);
	int updateByPrimaryKeySelective(User record);
    User selectByPrimaryKey(String userid);
}
