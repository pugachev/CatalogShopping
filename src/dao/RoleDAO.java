
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

public class RoleDAO {
    private static final String INSERTSQL = "insert into roles values(?,?)";
    
    private DataSource ds;
    
    public RoleDAO() {
      ds = DaoUtil.getSource();
    }
        
    public void insertRole(String id,String[] roles) throws SQLException{
        Connection con = ds.getConnection();
       
        PreparedStatement stmt = con.prepareStatement(INSERTSQL);
        
        try{

          for(int i=0;i<roles.length;i++){
            stmt.setString(1,id);
            stmt.setString(2,roles[i]);
            stmt.executeUpdate();
            stmt.clearParameters();
           }
        }catch(SQLException ex){
          throw ex;
        }finally{
          stmt.close();
          con.close();
        }
        return;    
    }
        
}
