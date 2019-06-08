
package logic;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import model.Member;
import dao.MemberDAO;

public class AuthLogic {
	
	public AuthLogic(){
	}
	
	public void login(HttpServletRequest request) throws SQLException{
        //1)ユーザIDの取得
        String uid = request.getRemoteUser();
        
        MemberDAO mDao = new MemberDAO();
        Member mem = mDao.getMember(uid);
        request.getSession().setAttribute("login",mem);
        
        //2)ユーザのロールとしてadminがある場合
        if(request.isUserInRole("admin")){
        	request.getSession().setAttribute("admin",mem);
        }
        
        return;
	}
}
