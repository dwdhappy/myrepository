package cn.lexed.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.lexed.dao.UserMapper;
import cn.lexed.pojo.User;
import cn.lexed.service.UserService;

/**
* @ClassName: UserServiceImpl
* @Description: 
* @author 大来老师
* @date 2021年6月18日
* @version V1.0 
*/
@Service("userService")
public class UserServiceImpl implements UserService{

	@Resource(name="userMapper")  
    private UserMapper userMapper;  
	
    public User getUserById(int id) {
		
		return userMapper.findByUserid(id);
	}

	public User findByUsername(String name) {
		
		return userMapper.findByUsername(name);
	}

	@Override
	public List<User> selectByList() {
		
		return userMapper.selectByList();
	}

	@Override
	public boolean saveUser(User user) {
	  return userMapper.saveUser(user);
		
	}

	@Override
	public boolean updateUser(User user) {
		
		return userMapper.updateUser(user);
	}

	@Override
	public boolean deleteUser(int id) {
		
		return userMapper.deleteUser(id);
	}

	
	
	@Override
	public User loginUser(User u) {
		// TODO Auto-generated method stub
		return userMapper.loginUser(u);
	}
}
