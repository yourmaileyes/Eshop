package com.zzc.webshop.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zzc.webshop.biz.MessageBiz;
import com.zzc.webshop.entity.Message;
import com.zzc.webshop.mapper.MessageMapper;
@Service(value="MessageBiz")
public class MessageBizImpl implements MessageBiz{
	@Autowired
	MessageMapper messageMapper;

	@Override
	public int insert(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.insert(record);
	}

	@Override
	public int insertSelective(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.insertSelective(record);
	}

	@Override
	public List<Message> selectmessage(String fromid) {
		// TODO Auto-generated method stub
		return messageMapper.selectmessage(fromid);
	}

	@Override
	public List<Message> selectallmessage() {
		// TODO Auto-generated method stub
		return messageMapper.selectallmessage();
	}

	@Override
	public int updatereadmessage(String fromid) {
		// TODO Auto-generated method stub
		return messageMapper.updatereadmessage(fromid);
	}

}
