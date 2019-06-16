
package action.catalog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.ProductDAOUtil;
import model.Product;

public class CatalogDetailSubShowAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

    	System.out.println(">>> CatalogDetailSubShowAction 通過 <<<");

        ProductDAOUtil util = new ProductDAOUtil();

        //1)セッション情報からidで指定されたProductを取り出す
        Product pro = util.getProductById(form, request.getSession());

        if (pro == null) {
            //2)CatalogDAOを利用してProductを取り出す
            pro = util.getProductById(form);
        }
        request.setAttribute("product", pro);

        return mapping.findForward("show");
    }
}