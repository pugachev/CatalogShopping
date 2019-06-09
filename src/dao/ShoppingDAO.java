package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.sql.DataSource;

import model.CartItem;
import model.ShoppingCart;

public class ShoppingDAO {

    //購入テーブルに挿入するSQL
    private static final String INSERTSHOPPING = "insert into shopping values(?,?,?)";

    //購入詳細テーブルに挿入するSQL
    private static final String INSERTSHOPPINGDETAIL = "insert into shoppingdetail values(?,?,?,?,?)";

    //購入金額の合計を取得する
    private static final String SEARCHTOALFEE = "select userid,sum(shoppingdetail.totalfee) as totalfee from shopping left join shoppingdetail on shopping.id = shoppingdetail.shoppingid where userid= ? and shoppingdate= ? group by userid;";

    private DataSource ds;
    private int        totalfee;

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
                totalfee=0;
                totalfee = item.getProduct().getPrice()*item.getCount();
                p2.setInt(5,totalfee);
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

    public int searchTotalFee(String uid) throws SQLException {
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        int       rcvTotalfee = 0;

        //1)購入日の日付を取得
        Date now = nowDate();

        Connection con = ds.getConnection();

        try {

            pStmt = con.prepareStatement(SEARCHTOALFEE);


            pStmt.setString(1,uid);
            pStmt.setDate(2,now);

            rs = pStmt.executeQuery();

            while (rs.next())
            {
                rcvTotalfee = rs.getInt("totalfee");
            }

        } catch (SQLException ex) {
            throw ex;
        } finally {
            if(rs != null){
                rs.close();
            }
            pStmt.close();
            con.close();
        }

        return rcvTotalfee;
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