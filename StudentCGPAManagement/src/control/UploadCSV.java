package control;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

import dao.DAO;


/**
 * Servlet implementation class UploadCSV
 */
@WebServlet("/UploadCSV")
@MultipartConfig
public class UploadCSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String DATA_DIRECTORY = "C:/tempdata/";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadCSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Part filePart = request.getPart("upload_file");  // Retrieves <input type="file" name="upload_file">
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			
			// redirecting if chosen file is not csv
			String extension = FilenameUtils.getExtension(fileName);
			
			if(!extension.equalsIgnoreCase("csv")) {
				System.out.println("Not csv");
				response.sendRedirect("admin_home.jsp?s=invalidfile#upload_div");
				return;
			}
			
			InputStream fileContent = filePart.getInputStream();
			File uploads = new File(DATA_DIRECTORY);
			if (!uploads.exists())
				uploads.mkdir();

			File file = new File(uploads, fileName);
			if (file.exists())
				file.delete();

			Files.copy(fileContent, file.toPath());

			String uploadedFilePath = DATA_DIRECTORY + File.separator + fileName;

			DAO dao = new DAO();
			boolean pushed = dao.pushCSVData(uploadedFilePath);

			if (pushed) {
				response.sendRedirect("admin_home.jsp?s=success#upload_div");
				return;
			} else {
				response.sendRedirect("admin_home.jsp?s=failure#upload_div");
				return;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("admin_home.jsp?s=error#upload_div");
		}
		
	}

}
