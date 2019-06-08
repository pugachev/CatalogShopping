
package action.catalog;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.actions.LookupDispatchAction;

public class CatalogPageAction extends LookupDispatchAction {
    
    protected Map<String,String> getKeyMethodMap() {
        //1)LookupDispatchActionの利用方法
        Map<String,String> map = new HashMap<String,String>();
        map.put("next","nextPage");
        map.put("back","backPage");
        return map;
    }
    
    private ActionForward transitPage(ActionMapping mapping,int offset,
        HttpServletRequest request) throws Exception { 
            
        //表示する番号をリクエストに設定する
        request.setAttribute("offset",Integer.toString(offset));
        return mapping.findForward("show");
    }
     
    public ActionForward nextPage(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        int offset = getOffset(form);
        return transitPage(mapping,offset+10,request);
    }
     
    public ActionForward backPage(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) throws Exception {
        int offset = getOffset(form);
        return transitPage(mapping,offset-10,request);
    }

    private int getOffset(ActionForm form) {
        DynaActionForm dForm = (DynaActionForm)form;
        int offset = ((Integer)dForm.get("offset")).intValue();
        return offset;
    }

}
