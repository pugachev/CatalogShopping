
package action.catalog;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import dao.CatalogDAO;

import action.form.MasterMainForm;


public class MasterChangeAction extends Action {
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        MasterMainForm mForm = (MasterMainForm)form;
        CatalogDAO dao = new CatalogDAO();
        
        @SuppressWarnings("unchecked")
        List<Product> oldList = (List) request.getSession().getAttribute("oldlist");
        List<Product> newList = mForm.getAllData();
        
        //1)商品IDで取り出せるように更新後のコレクションを変換する
        Map<Integer,Product> proMap = new HashMap<Integer,Product>();
        for(int i=0;i<newList.size();i++){
            Product newProduct = (Product) newList.get(i);
            Integer id = new Integer(newProduct.getId());
            proMap.put(id,newProduct);
        }
        
        //2)変更されたものだけを更新する
        for(int i=0;i<oldList.size();i++){
            Product oldProduct = oldList.get(i);
            Product newProduct = proMap.get(new Integer(oldProduct.getId()));
            
            if(isUpdated(oldProduct,newProduct)){
                dao.updateProdct(newProduct);
            }
            
        }
        
        return mapping.findForward("list");
    }
    
    private boolean isUpdated(Product oldProduct,Product newProduct){
        
        if(!oldProduct.getName().equals(newProduct.getName())){
            return true;
        }
        
        if(!oldProduct.getName().equals(newProduct.getName())){
            return true;
        }       
        
        if(!oldProduct.getDetail().equals(newProduct.getDetail())){
            return true;
        }
        
        if(oldProduct.getPrice() != newProduct.getPrice()){
            return true;
        }
        
        if(!oldProduct.getPictureUrl().equals(newProduct.getPictureUrl())){
            return true;
        }
        
        return false;
    }
    
}
