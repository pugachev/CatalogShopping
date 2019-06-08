package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;
import java.sql.Date;

import javax.sql.DataSource;

import model.CartItem;
import model.ShoppingCart;

public class ShoppingDAO {

    //購入テーブルに挿入するSQL
    private static final String INSERTSHOPPING = "insert into shopping values(?,?,?)";

    //購入詳細テーブルに挿入するSQL
    private static final String INSERTSHOPPINGDETAIL = "insert into shoppingdetail values(?,?,?,?)";

    private DataSource ds;

    public ShoppingDAO() {
        ds =  DaoUtil.getSource();;
    }

    public void purchaseCart(String uid, ShoppingCart cart) throws SQLException {

        //1)購入日の日付を取得
        Date now = nowDate();

        //2)購入テーブルと購入詳細テーブルに共通のIDを生成
        String id = getId();

        Connection con = ds.getConnection();

        //3)2つのテーブルに挿入するのでまとめてコミットする
        con.setAutoCommit(false);

        //shoppingテーブルに挿入
        PreparedStatement p1 = con.prepareStatement(INSERTSHOPPING);

        PreparedStatement p2 = con.prepareStatement(INSERTSHOPPINGDETAIL);

        try {
            //shoppingテーブルに挿入
            p1.setString(1, id);
            p1.setString(2, uid);
            p1.setDate(3, now);
            p1.execute();

            //shoppingdetailテーブルにカートアイテムの内容を挿入
            List<CartItem> items = cart.getItems();
            for (int i = 0; i < items.size(); i++) {
                CartItem item = (CartItem) items.get(i);
                p2.setString(1, id);
                p2.setInt(2, i);
                p2.setInt(3, item.getProduct().getId());
                p2.setInt(4, item.getCount());
                p2.executeUpdate();
            }

            con.commit();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            p2.close();
            p1.close();
            con.close();
        }
    }

    private Date nowDate() {
        Calendar cal = Calendar.getInstance();
        return new Date(cal.getTimeInMillis());
    }

    private String getId() {
        //4)日時とこのインスタンスのハッシュでIDとする
        return nowDate().getTime() + "." + this.hashCode();
    }

}