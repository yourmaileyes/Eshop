package com.zzc.webshop.biz;

import java.util.List;

import com.zzc.webshop.entity.Message;

public interface MessageBiz {
	List<Message> selectmessage(String fromid);
	List<Message> selectallmessage();
	int updatereadmessage(String fromid);
	int insert(Message record);

    int insertSelective(Message record);
}
