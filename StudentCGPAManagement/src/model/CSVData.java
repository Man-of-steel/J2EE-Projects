package model;

import java.sql.ResultSet;

import dao.DAO;

public class CSVData {
	private String studentId, studentName, marks, cgpa;
	
	public CSVData() {
		// TODO Auto-generated constructor stub
	}
	

	public CSVData(String studentId, String studentName, String marks, String cgpa) {
		this.studentId = studentId;
		this.studentName = studentName;
		this.marks = marks;
		this.cgpa = cgpa;
	}

	public CSVData(String[] data) {
		this(data[0], data[1], data[2], data[3]);
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getMarks() {
		return marks;
	}

	public void setMarks(String marks) {
		this.marks = marks;
	}

	public String getCgpa() {
		return cgpa;
	}

	public void setCgpa(String cgpa) {
		this.cgpa = cgpa;
	}
	
	public static CSVData getData(String studentId) {
		try {
			CSVData data = null;
			String sql = "select * from data_tbl where student_id = '"+studentId+"'";
			ResultSet rs = new DAO().getData(sql);
			if(rs.next()) {
				data = new CSVData();
				data.setStudentId(rs.getString("student_id"));
				data.setStudentName(rs.getString("student_name"));
				data.setMarks(rs.getString("marks"));
				data.setCgpa(rs.getString("CGPA"));
			}
			return data;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return null;
		}
	}
	
	
}
