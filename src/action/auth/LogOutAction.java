
package action.auth;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.CatalogDAO;
import model.Product;

public class LogOutAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		request.getSession().invalidate();

		CatalogDAO dao = new CatalogDAO();
		List<Product> list = dao.getProductList();
		
		//1)新しいセッションに商品一覧を格納している
		request.getSession(true).setAttribute("products", list);

		return mapping.findForward("index");
	}
}