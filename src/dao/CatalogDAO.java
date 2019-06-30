package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import model.Product;

public class CatalogDAO {

	 //商品一覧を取得するSQL
    private static final String SELECT = "select * from catalog";

    //キーワード検索するSQL
    private static final String SELECTKEY = "select * from catalog where detail like ? or name like ?";

    //商品名検索するSQL
    private static final String SELECTKEYBYNAME = "select * from catalog where name like ";

	 //IDで商品を検索するSQL
	 private static final String SELECTDETAIL = "select * from catalog where id=?";

    //商品を追加するSQL
	 private static final String INSERTCATLOG = "insert into catalog(name,price,detail,pictureUrl) values(?,?,?,?);";

    //商品を更新するSQL
    private static final String UPDATECATALOG = "update catalog set name=?,detail=?,price=?,pictureUrl=? where id = ?";

    //表示グループ数を取得するSQL
    private static final String COUNT_DISPGROUP = "select count(distinct dispgroup) as cnt from catalog";

    //表示グループの全データを取得するSQL
    private static final String SELCT_DISPGROUPT = "select distinct dispgroup from catalog";

    //表示グループの代表データを取得するSQL
    private static final String SELECT_DAIHYOU_DATA_DISPGROUP="select * from catalog where dispgroup = ? and daihyou=?";

    //表示グループ毎の全てのデータを取得するSQL
    private static final String SELECT_ALL_DATA_DISPGROUP = "select * from catalog where dispgroup = ?";


    private DataSource source;

    public CatalogDAO() {
        source = DaoUtil.getSource();
    }

    public String getDispgroup()
    {
    	StringBuilder sb = new StringBuilder();
    	String rcvList="";
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;

        try
        {
            con = source.getConnection();

            pStmt = con.prepareStatement(SELCT_DISPGROUPT);

            rs = pStmt.executeQuery();

            while (rs.next())
            {
            	sb.append(rs.getString("dispgroup"));
            	sb.append(",");
            }
        }
        catch(Exception ex)
        {
        	System.out.println("Product getDispgroup");
        }


    	return sb.toString();
    }

    //表示グループ毎の全てのデータを取得するSQL
    public List<Product> getProductListByGroup(String gname) throws SQLException {
        List<Product> list = new ArrayList<Product>();
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;

        try {

            con = source.getConnection();

            pStmt = con.prepareStatement(SELECT_ALL_DATA_DISPGROUP);
            pStmt.setString(1,gname);
            rs = pStmt.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs));
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

        return list;
    }
    //表示グループの代表データを取得するSQL
    public Product getDaihyouDataDispgroup(String gname)
    {
    	Product pro = new Product();

        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;

        try
        {
            con = source.getConnection();

            pStmt = con.prepareStatement(SELECT_DAIHYOU_DATA_DISPGROUP);
            pStmt.setString(1,gname);
            pStmt.setInt(2, 1);

            rs = pStmt.executeQuery();

            while (rs.next())
            {
                pro.setId(rs.getInt("id"));
                pro.setName(rs.getString("name"));
                pro.setPrice(rs.getInt("price"));
                pro.setDetail(rs.getString("detail"));
                pro.setPictureUrl(rs.getString("pictureurl"));
                pro.setDaihyou(rs.getInt("daihyou"));
                pro.setDispgroup(rs.getString("dispgroup"));
            }
        }
        catch(Exception ex)
        {
        	System.out.println("Product getDaihyouDataDispgroup");
        }

        return pro;
    }

    //表示グループ数を取得するSQL
    public int getConutDispgropu() throws SQLException
    {
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;
        int rcvCnt = 0;

        try {

            con = source.getConnection();

            pStmt = con.prepareStatement(COUNT_DISPGROUP);
            rs = pStmt.executeQuery();

            while (rs.next())
            {
            	rcvCnt = rs.getInt("cnt");
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

        return rcvCnt;
    }

    public void updateProdct(Product newpro) throws SQLException{
        //新しく入力された商品にテーブルを更新する
        Connection con = source.getConnection();
        PreparedStatement pStmt = null;

        try{
            pStmt = con.prepareStatement(UPDATECATALOG);
            pStmt.setString(1,newpro.getName());
            pStmt.setString(2,newpro.getDetail());
            pStmt.setInt(3,newpro.getPrice());
            pStmt.setString(4,newpro.getPictureUrl());
            pStmt.setInt(5,newpro.getId());
            pStmt.executeUpdate();

        }catch(SQLException ex){
            throw ex;

        }finally{
            pStmt.close();
            con.close();
        }
    }

    public Product getProduct(int id) throws Exception{
        Connection con = source.getConnection();
        PreparedStatement pStmt = null;
        ResultSet rs = null;

        try{
            pStmt = con.prepareStatement(SELECTDETAIL);
            pStmt.setInt(1,id);
            rs = pStmt.executeQuery();

            if(rs.next()){
                return getProduct(rs);
            }

        }catch(SQLException ex){
            throw ex;
        }finally{
            if(rs != null){
                rs.close();
            }
            pStmt.close();
            con.close();
        }

        return null;
    }

    public List<Product> getProductList() throws SQLException {
        List<Product> list = new ArrayList<Product>();
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;

        try {

            con = source.getConnection();

            pStmt = con.prepareStatement(SELECT);
            rs = pStmt.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs));
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

        return list;
    }

    public List<Product> getProductListByName(String keyword) throws SQLException {
        List<Product> list = new ArrayList<Product>();
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;

        try {

            con = source.getConnection();

            String tmp = "select * from catalog where name like '%" + keyword +"%'";
            System.out.println("getProductListByName sql " + tmp);
            pStmt = con.prepareStatement(tmp);

//            String kw = "%"+keyword+"%";
//
//            pStmt.setString(1,kw);



            rs = pStmt.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs));
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

        return list;

    }

    public List<Product> getProductList(String keyword) throws SQLException {
        List<Product> list = new ArrayList<Product>();
        Connection con = null;
        PreparedStatement pStmt = null;
        ResultSet rs = null;

        try {

            con = source.getConnection();

            pStmt = con.prepareStatement(SELECTKEY);

            String kw = "%"+keyword+"%";

            pStmt.setString(1,kw);
            pStmt.setString(2,kw);

            rs = pStmt.executeQuery();

            while (rs.next()) {
                list.add(getProduct(rs));
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

        return list;

    }

    public void entry(Product pro) throws SQLException {
        //新しく入力された商品にテーブルを追加する
        Connection con = source.getConnection();
        PreparedStatement pStmt = null;

        try{
            pStmt = con.prepareStatement(INSERTCATLOG);

            pStmt.setString(1,pro.getName());
            pStmt.setInt(2,pro.getPrice());
            pStmt.setString(3,pro.getDetail());
            pStmt.setString(4,pro.getPictureUrl());
            pStmt.executeUpdate();

        }catch(SQLException ex){
            throw ex;
        }finally{
            pStmt.close();
            con.close();
        }
    }

    private Product getProduct(ResultSet rs) throws SQLException {
        Product pro = new Product();

        pro.setId(rs.getInt("id"));
        pro.setName(rs.getString("name"));
        pro.setPrice(rs.getInt("price"));
        pro.setDetail(rs.getString("detail"));
        pro.setPictureUrl(rs.getString("pictureurl"));
        pro.setDaihyou(rs.getInt("daihyou"));
        pro.setDispgroup(rs.getString("dispgroup"));

        return pro;
    }

}
