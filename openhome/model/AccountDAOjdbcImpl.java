package cc.openhome.model;

import javax.sql.DataSource;

import java.sql.SQLException;

import java.sql.*;


public class AccountDAOjdbcImpl implements AccountDAO {
	private DataSource dataSource;

	public AccountDAOjdbcImpl(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public boolean isUserExist(Account account) {
		// TODO Auto-generated method stub
        Connection conn=null;
        PreparedStatement stmt=null;
        SQLException ex=null;
        boolean existed=false;
        

		try {
            
        	conn = dataSource.getConnection();
            stmt=conn.prepareStatement("select count(1) from t_account where name=?");
            stmt.setString(1, account.getName());
            ResultSet rs=stmt.executeQuery();
            
            if(rs.next()){
            	existed=(rs.getInt(1)==1);
            }
        } catch (SQLException e) {
            ex = e;
        } finally {
            if (conn != null) {
                try {
                    
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
            if(ex != null) {
                throw new RuntimeException(ex);
            }
        }
		
		
		return existed;
	}

	public void addAccount(Account account) {
		// TODO Auto-generated method stub

		Connection conn=null;
        PreparedStatement stmt=null;
        SQLException ex=null;
        

		try {
            
        	conn = dataSource.getConnection();
            stmt=conn.prepareStatement("insert into t_account(name,password,email) values(?,?,?)");
            stmt.setString(1, account.getName());
            stmt.setString(2, account.getPassword());
            stmt.setString(3, account.getEmail());
            
            stmt.executeUpdate();
            
      
        } catch (SQLException e) {
            ex = e;
        } finally {
            if (conn != null) {
                try {
                    
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
            if(ex != null) {
                throw new RuntimeException(ex);
            }
        }
		
		
	}

	public Account getAccount(Account account) {
		// TODO Auto-generated method stub
		
		Connection conn=null;
        PreparedStatement stmt=null;
        SQLException ex=null;
        
        Account acct=null;
        

		try {
            
        	conn = dataSource.getConnection();
            stmt=conn.prepareStatement("select password,email from t_account where name=?");
            stmt.setString(1, account.getName());
            ResultSet rs=stmt.executeQuery();

            if(rs.next()){
            	acct=new Account(account.getName(),rs.getString(1),rs.getString(2));
            	
            }
        } catch (SQLException e) {
            ex = e;
        } finally {
            if (conn != null) {
                try {
                    
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    if(ex == null) {
                        ex = e;
                    }
                }
            }
            if(ex != null) {
                throw new RuntimeException(ex);
            }
        }
		
		
		
		return acct;
	}

}
