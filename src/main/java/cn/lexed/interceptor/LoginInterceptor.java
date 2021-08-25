package cn.lexed.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.lexed.pojo.User;


/**
* @ClassName: LoginInterceptor
* @Description: 
* @author 大来老师
* @date 2021年6月21日
* @version V1.0 
*/
/*
 * SpringMVC 中的 Interceptor 拦截器是非常重要和相当有用的，
 * 它的主要作用是拦截指定的用户请求，并进行相应的预处理与后处理
 * 
 * 自定义拦截器，需要实现 HandlerInterceptor 接口。而该接口中含有三个方法：
       ➢ preHandle(request,response, Object handler)：
     该方法在处理器方法执行之前执行。其返回值为 boolean，若为 true，则紧接着会执行处理器方
     法，且会将 afterCompletion()方法放入到一个专门的方法栈中等待执行。

      ➢ postHandle(request,response, Object handler,modelAndView)：
     该方法在处理器方法执行之后执行。处理器方法若最终未被执行，则该方法不会执行。
     由于该方法是在处理器方法执行完后执行，且该方法参数中包含 ModelAndView，所以该方法可以修
     改处理器方法的处理结果数据，且可以修改跳转方向。

    ➢ afterCompletion(request,response, Object handler, Exception ex)：
   当 preHandle()方法返回 true 时，会将该方法放到专门的方法栈中，等到对请求进行响应的所有
    工作完成之后才执行该方法。即该方法是在中央调度器渲染（数据填充）了响应页面之后执行的，此
    时对 ModelAndView 再操作也对响应无济于事。
 * */

//                         extends HandlerInterceptorAdapter
public class LoginInterceptor implements HandlerInterceptor{

	
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	
	//拦截非法登录
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		//获取session对象
		HttpSession session = request.getSession();
		//获取登录用户信息
	    User user= (User)session.getAttribute("currentuser");
        //判断登录用户信息		
		if(null != user){ //dev SUCCESS
			return true;
		}else{
			response.sendRedirect(request.getContextPath()+"/403.jsp");
			return false;
		}
		
		
	}

}
