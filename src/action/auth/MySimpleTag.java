package action.auth;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import dao.ShoppingDAO;

public class MySimpleTag extends TagSupport {
  private String name;

  	@Override
	public int doEndTag() throws JspException {

  	 	ShoppingDAO dao = new ShoppingDAO();
  		int rcvTotalfee = 0;
		try
		{
			rcvTotalfee = dao.searchTotalFee(name);
			pageContext.getOut().print(rcvTotalfee);
			System.out.println(">>> rcvTotalfee=" + rcvTotalfee);
		}
		catch (SQLException e)
		{
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}

		return rcvTotalfee;
	}

// name属性をセットするためのセッタ
  public void setName(String name) {
      this.name = name;
  }
}