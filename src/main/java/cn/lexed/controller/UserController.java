package cn.lexed.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


import cn.lexed.pojo.User;
import cn.lexed.service.UserService;

/**
* @ClassName: UserController
* @Description: 
* @author 大来老师
* @date 2021年6月18日
* @version V1.0 
*/
@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	
	@Resource(name="userService")  
    private UserService userService; 
	
	private User currentuser;
	
	//访问
	@RequestMapping("/view")
    public String view() {
        return "login";
    }
	
	//登录
	 @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String login(User u, Model model,HttpServletRequest request) {
		    
		    HttpSession session=request.getSession();	 
	    	String name = u.getName();
	    	try{
	    		 currentuser = userService.findByUsername(name);
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}	       
	        if (currentuser == null || !u.getPassword().equals(currentuser.getPassword())) {
	            return "redirect:/user/view";
	        } else {
	        	session.setAttribute("currentuser", currentuser);
	            return "redirect:/user/userList";
	        }
	  }
	 
	 
	 //查询所有
	 @RequestMapping("/userList")
	    public String userList(@RequestParam(required=true,defaultValue="1") Integer pn,HttpServletRequest request,Model model){
	        PageHelper.startPage(pn, 5);
	        List<User> userList = userService.selectByList();
	        PageInfo<User> p=new PageInfo<User>(userList);
	        model.addAttribute("currentuser", currentuser);
	        model.addAttribute("page", p);
	        model.addAttribute("list",userList);
	        return "userList";
	 }
	 
	 //新增按钮
	 @RequestMapping("/toAddUser")
	    public String toAddUser(){
	        return "addUser";
	 }
	 
	 /*
	  * 添加用户
	  */
//	 @RequestMapping("/addUser") 
//	    public String addUser(Model model,User user){
//		 System.out.println(user);
//	        if(userService.saveUser(user)){
//	        	return "redirect:/user/userList";
//	        }else{
//	        	return "redirect:/user/toAddUser";
//	        }
//	        
//	 }
	 /*
	  * 添加用户,使用ajax的情况
	  * 
	  * 	 @ResponseBody:作用为将java数据转为json格式的数据
	  */
	 @RequestMapping("/addUser") 
	 @ResponseBody//使用ajax模式返回jason数据
	 public String addUser(Model model,User user){
		 //用字符串写出json对象 ，"\"是转义符
		 String results="{\"results\":\"error\"}";
		 boolean ff=userService.saveUser(user);
		 if(ff){
			 results="{\"results\":\"success\"}";
			 return results;
		 }
		//返回到发送数据的起点,到时后字符串会被转回json格式(@ResponseBody会帮助转换)
		 return results;
	 }
	 
	 
	 
	 
	 
	 //修改按钮
	 @RequestMapping("/getUser")  
	    public String getUser(int id,Model model){
	        model.addAttribute("user", userService.getUserById(id)); 
	        
	        return "updateUser";
	      
	 }
	 
	 //修改操作
//	 @RequestMapping("updateUser")  
//	    public String UpdateUser(Model model,User user){
//	             if(userService.updateUser(user)){  
//	                    return "redirect:/user/userList";  
//	             }else{
//	            	    return "/error";  
//	             } 
//	             
//	 }
	 //修改操作(使用ajax)
	 @RequestMapping("updateUser")
	 @ResponseBody
	    public String UpdateUser(Model model,@RequestBody User user){//@RequestBody:可以为后台接收一个json格式的字符串
		 String results="{\"results\":\"error\"}";
		 boolean ff=userService.updateUser(user);
		 if(ff){
			 results="{\"results\":\"success\"}";
			 return results;
		 }
		 return results;       
	 }
	 
	
	 
	 //删除
//	@RequestMapping("/delUser") 
//	    public String deleteUser(int id,Model model){
//		   if(userService.deleteUser(id)){
//			   return "redirect:/user/userList";
//		   }else{
//			   return "/error";
//		   }
//	        
//	        
//	 }
	//删除(使用ajax)
	@RequestMapping("/delUser") 
	@ResponseBody
    public String deleteUser(int id,Model model){
		String results;
		
	   if(userService.deleteUser(id)){
		   results="{\"results\":\"success\"}";
		   return results;
	   }else{
		   results="{\"results\":\"error\"}";
		   return results;
	   }
        
        
 }

	 
	 //退出登录
	 @RequestMapping(value="/logout")
		public String logout(HttpSession session){
			//清除session
			session.removeAttribute("currentuser");
			return "login";
	 }
	
	 @RequestMapping(value="/gotext")
	 public String dotext()
	 {
		 return "text";
	 }
	 //ajax设置服务器返回字符串数据
	 /*
	  *text/plain;charset 默认是ISO-8859-1作为contentType，导致中文乱码
	  * 通过在ResponseMapping添加produces属性指定编码
	  * */
	 @RequestMapping(value="/returntext",produces="text/plain;charset=utf-8")
	 @ResponseBody
	 public String returntext()
	 {
		 return "Hello!";
	 }
}
