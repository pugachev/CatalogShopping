
package module1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


public class InputAction extends Action {

	private String val;

	public ActionForward execute(ActionMapping map, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" >>> InputAction 通過 <<< ");
		return map.findForward("success");
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}


}
