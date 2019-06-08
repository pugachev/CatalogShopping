package action.auth;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class MySimpleTag extends TagSupport {
  private String name;

  	@Override
	public int doEndTag() throws JspException {

		    try {
		        // 出力
		        pageContext.getOut().print("あなたが入力した名前は「" + name + "」です。");
		        Logger.getLogger(MySimpleTag.class.getName()).log(Level.SEVERE, null, name);
		    } catch (IOException ex) {
		        Logger.getLogger(MySimpleTag.class.getName()).log(Level.SEVERE, null, ex);
		    }

		    return 0;
	}

// name属性をセットするためのセッタ
  public void setName(String name) {
      this.name = name;
  }
}