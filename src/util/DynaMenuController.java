package util;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.tiles.ComponentContext;
import org.apache.struts.tiles.Controller;

public class DynaMenuController implements Controller{

	@Override
	public void execute(ComponentContext arg0, HttpServletRequest arg1, HttpServletResponse arg2, ServletContext arg3) throws Exception {

//		System.out.println(" >>> DynaMenuController start <<< ");
//        //メニューリストの作成
//        List menuList = new ArrayList();
//        SimpleMenuItem menu = new SimpleMenuItem();
//        menu.setLink("/WEB-INF/view/searchadd.jsp");
//        menu.setValue("カレンダー");
//        menuList.add(menu);
//
//        //メニューリストの登録
//        arg0.putAttribute("menuList", menuList);
//
//		System.out.println(" >>> DynaMenuController end <<< ");

	}

	@Override
	public void perform(ComponentContext arg0, HttpServletRequest arg1, HttpServletResponse arg2, ServletContext arg3)
			throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ

	}

}
