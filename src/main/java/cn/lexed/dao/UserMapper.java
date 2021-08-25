package cn.lexed.dao;

import java.util.List;

import cn.lexed.pojo.User;

/**
* @ClassName: UserMapper
* @Description: 
* @author 大来老师
* @date 2021年6月18日
* @version V1.0 
*/
public interface UserMapper {

	
	public abstract User findByUserid(int id);
	
	public abstract User findByUsername(String name);
	
	public abstract List<User> selectByList();
	
	public abstract boolean saveUser(User user);
	
	public abstract boolean updateUser(User user);
	
	public abstract boolean deleteUser(int id);
	
	public abstract User loginUser(User u);
	
}
