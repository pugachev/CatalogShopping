package dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import model.Member;

public class MemberDAO {

    //会員登録をするSQL
    private static final String INSERTSQL = "insert into Member values(?,?,?,?,?,?)";    
    //指定したメールアドレスの数を調べるSQL
    private static final String ISENTRIEDSQL = "select COUNT(*) from Member where mail=? ";
    //メールアドレスを元に会員情報を検索するSQL
    private static final String SELECTSQL = "select name,mail,address,tel from Member where mail=?";
    
    private DataSource ds;    
    
    public MemberDAO() {
        ds = DaoUtil.getSource();
    }
    
    public void entry(String name,String password,String address,String tel,String mail,Date birth) throws SQLException{
        
        //1)java.sql.Dateクラスへ変換
        java.sql.Date date = null;
        if(birth != null){
            date = new java.sql.Date(birth.getTime());
        }
        
        Connection con = ds.getConnection();
       
        PreparedStatement stmt = con.prepareStatement(INSERTSQL);
        
        try{
        
            stmt.setString(1,name);
            stmt.setString(2,mail);
            stmt.setString(3,password);
            stmt.setString(4,address);
            stmt.setString(5,tel);
            stmt.setDate(6,date);
       
            stmt.executeUpdate();
        
        }catch(SQLException ex){
            throw ex;
        }finally{
          stmt.close();
          con.close();
        }
        return;
    }

    public Member getMember(String mail) throws SQLException{
         Connection con = ds.getConnection();
        
         PreparedStatement stmt = con.prepareStatement(SELECTSQL);
         
         try{
         
            stmt.setString(1,mail);
        
            ResultSet rs = stmt.executeQuery();
         
            if(rs.next()){
               return toMember(rs);
            }
         
         }catch(SQLException ex){
            throw ex;
         }finally{
           stmt.close();
           con.close();
         }
         return null;   
    }
    
    private Member toMember(ResultSet rs) throws SQLException {
        Member mem = new Member();
        mem.setName(rs.getString("name"));
        mem.setAddress(rs.getString("address"));
        mem.setMail(rs.getString("mail"));
        mem.setTel(rs.getString("tel"));
        
        return mem;
    }

    public boolean isEntriedMail(String mail) throws SQLException{
        Connection con = ds.getConnection();
        
        //2)メールアドレスの重複チェック
        PreparedStatement stmt = con.prepareStatement(ISENTRIEDSQL);
        ResultSet rs = null;
        try{
        
            stmt.setString(1,mail);
            rs = stmt.executeQuery();
            
            if(rs.next()){
                int count = rs.getInt(1);
                if(count == 0){
                    return false;
                }
            }
         
         }catch(SQLException ex){
            return true;
         }finally{
            if(rs != null){
                rs.close();
            }
            stmt.close();
            con.close();
         }
         
         return true;
    }
    
}
