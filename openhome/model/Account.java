/**
 * 
 */
package cc.openhome.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author admin
 *
 */
public class Account implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String name;
    private String password;
    private String email;
    
    public Account(){
    	
    }
    
	

	public Account(String name, String password, String email) {
		super();
		this.name = name;
		this.password = password;
		this.email = email;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
    
    
	
	
}
