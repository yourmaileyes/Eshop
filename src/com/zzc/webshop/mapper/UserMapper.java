package com.zzc.webshop.mapper;


import java.util.List;
import java.util.Map;

import com.zzc.webshop.entity.User;

public interface UserMapper {
	List<User> showuser();
	User selectusername(String username);
	User selectLoginUser(Map map);
    int deleteByPrimaryKey(String userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}