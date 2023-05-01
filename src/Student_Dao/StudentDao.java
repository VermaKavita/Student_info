package Student_Dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Student_Bean.StudentBean;

public class StudentDao {
public Connection con;
public Connection getCon() throws ClassNotFoundException, SQLException{
	Class.forName("com.mysql.jdbc.Driver");
	return DriverManager.getConnection("jdbc:mysql://localhost:3306/advance","root","kavita");
}
public int addStudent(StudentBean sb) throws SQLException, ClassNotFoundException{
	con=getCon();
	String qr="insert into Student_pro values(?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1, sb.getName());
	ps.setString(2,sb.getFather());
	ps.setString(3,sb.getMother());
	ps.setString(4,sb.getEmail());
	ps.setString(5,sb.getPwd());
	ps.setString(6,sb.getGender());
	ps.setLong(7,sb.getContact());
	int i=ps.executeUpdate();
	con.close();
	return i;
}
public List<StudentBean> show() throws ClassNotFoundException, SQLException {
	con = getCon();
	String qr = "select * from student_pro";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(qr);
	List<StudentBean> al = new ArrayList<StudentBean>();
	while (rs.next()) {
		StudentBean p = new StudentBean();
		p.setName(rs.getString("S_Name"));
		p.setFather(rs.getString("F_Name"));
		p.setMother(rs.getString("M_Name"));
		p.setContact(rs.getLong("contact"));
		p.setEmail(rs.getString("email"));
		p.setPwd(rs.getString("Pwd"));
		p.setGender(rs.getString("Gender"));
		al.add(p);
	}
	return al;
}
public int delete(StudentBean sb) throws ClassNotFoundException, SQLException {
	con = getCon();
	String qr = "delete from student_pro where email=?";
	PreparedStatement ps = con.prepareStatement(qr);
	ps.setString(1,sb.getEmail());
	int i = ps.executeUpdate();
	con.close();
	return i;
}
public int update(StudentBean sb) throws ClassNotFoundException, SQLException {
	con=getCon();
	String qr="update student_pro set S_Name=?, F_name=?, M_Name=?, Gender=?, Contact=? where email=?";
	PreparedStatement ps=con.prepareStatement(qr);
	ps.setString(1,sb.getName());
	ps.setString(2,sb.getFather());
	ps.setString(3,sb.getMother());
	ps.setString(4,sb.getGender());
	ps.setLong(5,sb.getContact());
	ps.setString(6,sb.getEmail());
	int i=ps.executeUpdate();
	con.close();
	return i;
}
public List<StudentBean> showByPage(int s,int t) throws ClassNotFoundException, SQLException
{
	con=getCon();
	String qr="select * from student_pro limit "+s+","+t;
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(qr);
	List<StudentBean> al=new ArrayList<StudentBean>();
	while(rs.next())
	{
		StudentBean p=new StudentBean();
		p.setName(rs.getString("S_Name"));
		p.setFather(rs.getString("F_Name"));
		p.setMother(rs.getString("M_Name"));
		p.setEmail(rs.getString("email"));
		p.setGender(rs.getString("Gender"));
		p.setContact(rs.getLong("contact"));
		al.add(p);
	}
	return al;
}
}
