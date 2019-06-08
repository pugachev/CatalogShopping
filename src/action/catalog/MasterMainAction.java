
package action.catalog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.CatalogDAO;

import action.form.MasterMainForm;
import model.Product;

public class MasterMainAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        CatalogDAO dao = new CatalogDAO();        
        List<Product> list = dao.getProductList();
        
        //1)変更された情報のみを更新するために現状を保存
        request.getSession().setAttribute("oldlist",list);
        
        //2)マスタ情報をフォームに表示するための初期化
        MasterMainForm mForm = new MasterMainForm();
        mForm.setData(list);
        request.setAttribute("CatalogMainForm",mForm);
        
        return mapping.findForward("list");
    }
}
