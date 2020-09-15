package user;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
 
import user.DBConnection;
import user.User;
 
/* Data Access Object
 * ���̺� �� �Ѱ��� DAO�� �ۼ��Ѵ�.
 * 
 * JSP_MEMBER ���̺�� ������ DAO��
 * ȸ�� �����͸� ó���ϴ� Ŭ�����̴�.
 */
public class userDAO 
{
    private static userDAO instance;
    
    // �̱��� ����
    private userDAO(){}
    public static userDAO getInstance(){
        if(instance==null)
            instance=new userDAO();
        return instance;
    }
   
    
    // ȸ�������� JSP_MEMBER ���̺� �����ϴ� �޼���
    public void insertMember(User user) throws SQLException
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        
        try {
            // Ŀ�ؼ��� �����´�.
            conn = DBConnection.getConnection();
            
            // �ڵ� Ŀ���� false�� �Ѵ�.
            conn.setAutoCommit(false);
            
            // ���� �����Ѵ�.
            // �������� ��� �ڵ����� ���õǰ� �ϱ� ���� sysdate�� ���
            StringBuffer sql = new StringBuffer();
            sql.append("insert into user values");
            sql.append("(?, ?)");        
            /* 
             * StringBuffer�� ��� ���� �������� toString()�޼��带
             * �̿��ؾ� �Ѵ�.
             */
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPassword());
            // ���� ����
            pstmt.executeUpdate();
            // �Ϸ�� Ŀ��
            conn.commit(); 
            
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            // ������ �ѹ�
            conn.rollback(); 
            
            throw new RuntimeException(sqle.getMessage());
        } finally {
            // Connection, PreparedStatement�� �ݴ´�.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        } // end try~catch 
    } // end insertMember()
    public int loginCheck(String id, String pw) 
    {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
 
        String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
        int x = -1;
 
        try {
            // ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
            StringBuffer query = new StringBuffer();
            query.append("SELECT PASSWORD FROM user WHERE ID=?");
 
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(query.toString());
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
            {
                dbPW = rs.getString("password"); // ����� ������ �ִ´�.
 
                if (dbPW.equals(pw)) 
                    x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
                else                  
                    x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
                
            } else {
                x = -1; // �ش� ���̵� ���� ���
            }
 
            return x;
 
        } catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
        } finally {
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
        }
    } // end loginCheck()
}