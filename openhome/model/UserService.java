package cc.openhome.model;

import java.text.DateFormat;
import java.util.*;
import java.io.*;
import java.util.*;


public class UserService {
    //private String USERS;
  //  private LinkedList<Blah> newest=new LinkedList<Blah>();
    private AccountDAO accountDAO;
   // private BlahDAO blahDAO;
  //  private Search1DAO search1DAO;
   // private Account1DAO account1DAO;
    
    //public UserService(String USERS) {
 //       this.USERS = USERS;
//    }
    
    public UserService(String USERS,AccountDAO userDAO) {
        this(userDAO);
    }
  // 改: public UserService(String USERS,AccountDAO userDAO,BlahDAO blahDAO,Account1DAO user1DAO) {
  //      this(userDAO,blahDAO,use1rDAO);
  //  }
    
    
    public UserService(AccountDAO userDAO){
    	this.accountDAO=userDAO;

    	//this.account1DAO=user1DAO;
    }

    public boolean isUserExisted(Account account) {
        return accountDAO.isUserExist(account);
    }
    
    public void add(Account account){
    	accountDAO.addAccount(account);
    }
    public Account getAccounted(Account account){  //
    	return accountDAO.getAccount(account);       //
    }                                           
    
    public boolean checkLogin(Account account) {
        if(account.getName() != null && account.getPassword() != null) {
          Account storedAcct = accountDAO.getAccount(account);  
          return storedAcct!=null && storedAcct.getPassword().equals(account.getPassword());
        }
        return false;
    }

    
      

    

    
   
}
