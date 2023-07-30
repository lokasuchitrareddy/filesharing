package databaseconnection;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215)
public class UploadAnyFile extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	Connection conn = null;
	byte[] priv=null;
	byte[] pub=null;
	byte[] realSig; String srealSig;


    public UploadAnyFile()
    {
        super();

    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// gets values of text fields
		HttpSession session=request.getSession();

		//out.println(user);
		try{
			conn =databasecon.getconnection();
			Statement st2 = conn.createStatement();
			InputStream inputStream = null;	// input stream of the upload file
			// obtains the upload file part in this multi part request
			Part filePart = request.getPart("file");
			String fileName = getFileName(filePart);
			//Get all the parts from request and write it to the file on server

			if (filePart != null)
			{
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			System.out.println("fileName"+fileName);
			// obtains input stream of the upload file
			System.out.println("1");
			inputStream = filePart.getInputStream();
			System.out.println("2");
			}

			// connects to the database

			Statement st1=conn.createStatement();
			st1.executeUpdate("delete from temp");
			String sql = "insert into temp values(?,?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, fileName);
			if (inputStream != null)
			{
				// fetches input stream of the upload file for the blob column
				statement.setBinaryStream(2, inputStream,(int) filePart.getSize());
			}


			// sends the statement to the database server
			int row = statement.executeUpdate();
			System.out.println("r="+row);
			if (row > 0)
			{

				getServletContext().getRequestDispatcher("/upload1.jsp").forward(request, response);
			}

			}
		catch(Exception e1)
		{
			e1.printStackTrace();
		}
		 finally
		 {
			if (conn != null)
			{
				// closes the database connection
				try
				{
					conn.close();
				} catch (SQLException ex)
				{
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
			//	request.setAttribute("Message", message);
			// forwards to the message page
		 }
	}
	private String getFileName(final Part part)
	{
		final String partHeader = part.getHeader("content-disposition");

		String[] sections = partHeader.split(";");

		for (String content : sections)
		{

			if (content.trim().startsWith("filename"))
			{
				return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");

			}

		}
		return null;
	}

}