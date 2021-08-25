package cn.lexed.service;

import java.util.List;

import cn.lexed.pojo.User;

/**
* @ClassName: UserService
* @Description: 
* @author 大来老师
* @date 2021年6月18日
* @version V1.0 
*/
public interface UserService {

	User loginUser(User u);
	
	User getUserById(int userId);

	User findByUsername(String name);

	List<User> selectByList();
	
	boolean saveUser(User user);

    boolean updateUser(User user);

    boolean deleteUser(int id);
	
	
	
	
}
