package databaseconnection;
import java.sql.Connection;
import java.sql.DriverManager;

public class databasecon
{
	static Connection connection;
	public static Connection getconnection()
	{


		try
		{

			Class.forName("com.mysql.cj.jdbc.Driver");

			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/securersa","root","Dinesh@1");


		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return connection;
	}

}
