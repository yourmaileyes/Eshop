package com.zzc.webshop.mapper;

import java.util.List;

import com.zzc.webshop.entity.Message;

public interface MessageMapper {
	List<Message> selectmessage(String fromid);
	List<Message> selectallmessage();
	int updatereadmessage(String fromid);
    int insert(Message record);

    int insertSelective(Message record);
}