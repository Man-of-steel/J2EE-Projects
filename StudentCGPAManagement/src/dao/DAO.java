package dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import model.CSVData;

public class DAO {
	
	private static final String DB_NAME = "student_cgpa_management";
	private static final String DB_USERNAME = "root";
	private static final String DB_PASSOWRD = "root";
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
	
	Connection connection;
	Statement statement;
	
	public DAO() {
		establishConnection();
	}
	
	private void establishConnection() {
		
		try {
			
			Class.forName(DB_DRIVER);
			
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + DB_NAME, DB_USERNAME, DB_PASSOWRD);
			
			statement = connection.createStatement();
			
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public int putData(String query) {
		
		try {
			
			int rows = statement.executeUpdate(query);
			return rows;
			
		}
		catch (Exception e) {
			System.out.println(e);
			return -1;
		}
		
	}
	
	public ResultSet getData(String query) {
		
		try {
			
			ResultSet rs = statement.executeQuery(query);
			return rs;
			
		}
		catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
	
	public boolean pushCSVData(String filePath) {
		try {
			File file = new File(filePath);
			BufferedReader br = new BufferedReader(new FileReader(file));
			
			// skipping first line since it contains labels
			br.readLine();
			
			List<String> lines = Files.readAllLines(file.toPath());
			for(String line : lines) {
				String[] data = line.split(",");
				CSVData csvData = new CSVData(data);
				
				String sql = "INSERT INTO `data_tbl` (`student_id`, `student_name`, `marks`, `CGPA`) \r\n" + 
						"VALUES ('"+csvData.getStudentId()+"', '"+csvData.getStudentName()+"', '"+csvData.getMarks()+"', '"+csvData.getCgpa()+"') \r\n" + 
						"ON DUPLICATE KEY UPDATE `student_id` = '"+csvData.getStudentId()+"', `student_name` = '"+csvData.getStudentName()+"', `marks` = '"+csvData.getMarks()+"', `CGPA` = '"+csvData.getCgpa()+"'";
				this.putData(sql);
			}
			
			br.close();
			
			file.delete();
			
			return true;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return false;
		}
	}

}
