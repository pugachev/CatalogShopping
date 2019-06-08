
package logic;

import java.sql.SQLException;
import java.util.Date;

import javax.sql.DataSource;

import logic.exception.AlreadyEntryException;

import dao.MemberDAO;
import dao.RoleDAO;

public class MemberEntryLogic {
        
    public MemberEntryLogic(){
    }
    
    public void entryMember(String name,String password,String address,String tel,String mail,Date birth) throws SQLException,AlreadyEntryException {
        MemberDAO dao = new MemberDAO();
        
        //1)メールアドレスの重複チェック
        if(dao.isEntriedMail(mail)){
        	throw new AlreadyEntryException();
        }
        
        //2)2つのDAOを利用して更新
        dao.entry(name,password,address,tel,mail,birth);
        
        RoleDAO rDao = new RoleDAO();
        
        //3)どのようなロールを与えるかを設定
        rDao.insertRole(mail,new String[]{"user"});
    }
}
