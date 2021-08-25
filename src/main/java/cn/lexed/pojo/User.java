package cn.lexed.pojo;


/**
* @ClassName: User
* @Description: 
* @author 大来老师
* @date 2021年6月18日
* @version V1.0 
*/
public class User {
	
     private Integer id;
	
    private String name;
    
    private String password;
    
    private Integer age;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public User(Integer id, String name, String password, Integer age) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.age = age;
	}

	public User() {
		super();
	}
    
    
    

}
