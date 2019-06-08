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
    
	 //IDで商品を検索するSQL
	 private static final String SELECTDETAIL = "select * from catalog where id=?";
        
    //商品を追加するSQL
	 private static final String INSERTCATLOG = "insert into catalog(name,price,detail,pictureUrl) values(?,?,?,?);";
    
    //商品を更新するSQL
    private static final String UPDATECATALOG = "update catalog set name=?,detail=?,price=?,pictureUrl=? where id = ?";

    
    private DataSource source;

    public CatalogDAO() {
        source = DaoUtil.getSource();
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
        
        return pro;
    }
    
}
