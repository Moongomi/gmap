package markers;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;
 
import user.DBConnection;
import markers.Markers;
 
public class markersDAO 
{
    private static markersDAO instance;
    
    private markersDAO(){}
    public static markersDAO getInstance(){
        if(instance==null)
            instance=new markersDAO();
        return instance;
    }
   
    public void insertMarkers(Markers markers) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {

            conn = DBConnection.getConnection();
            

            conn.setAutoCommit(false);
      
            StringBuffer sql = new StringBuffer();
            sql.append("insert into markers values");
            sql.append("(?,?,?,?)");        
    
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(3, markers.getId());
            pstmt.setString(1, markers.getLat());
            pstmt.setString(2, markers.getLng());
            pstmt.setString(4, markers.getPost());
            // 荑쇰━ �떎�뻾
            pstmt.executeUpdate();
            // �셿猷뚯떆 而ㅻ컠
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            // �삤瑜섏떆 濡ㅻ갚
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement瑜� �떕�뒗�떎.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } // end try~catch 
    } // end insertMember()

}