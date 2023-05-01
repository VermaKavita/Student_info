import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileuploadServlet extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/advance";
    private String dbUser = "root";
    private String dbPass = "kavita";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String name = request.getParameter("name");
        String father = request.getParameter("father");
        String mother=request.getParameter("mother");
        String email=request.getParameter("email");
        String pwd=request.getParameter("pwd");
        String gender=request.getParameter("gender");
        String cont=request.getParameter("contact");
        long contact=Long.parseLong(cont);
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO student_pro (S_Name, F_Name, M_Name, email, Pwd, Gender, contact, image) values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, father);
            st.setString(3,mother);
            st.setString(4, email);
            st.setString(5, pwd);
            st.setString(6, gender);
            st.setLong(7, contact);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                st.setBlob(8, inputStream);
            }
 
            // sends the statement to the database server
            int row = st.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/adminhome.jsp").forward(request, response);
        }
    }
}