package com.bjsxt.shopping.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;  
import java.util.*;    
import javax.servlet.ServletConfig;  
import javax.servlet.ServletContext;  
import org.apache.commons.fileupload.FileItem;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {

	private static final long serialVersionUID = -7744625344830285257L;
	String uploadPath = "";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	

	


	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		uploadPath = config.getInitParameter("fileuploadpath");
		System.out.println(uploadPath);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = -1;
		
		request.setCharacterEncoding("GB18030");
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			Iterator<FileItem> itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				if (item.isFormField()) {
					if (item.getFieldName().equals("id")) {
						id = Integer.parseInt(item.getString("GB18030"));
						System.out.println(id);
					}
					//System.out.println("��������:" + item.getFieldName() + "��������ֵ:" + item.getString("GB18030"));
				} else {
					if (item.getName() != null && !"".equals(item.getName())) {
						System.out.println("�ϴ��ļ��Ĵ�С:" + item.getSize());
						System.out.println("�ϴ��ļ�������:" + item.getContentType());
						// item.getName()�����ϴ��ļ��ڿͻ��˵�����·������
						System.out.println("�ϴ��ļ�������:" + item.getName());


						// �ϴ��ļ��ı���·��						
						File file = new File(uploadPath + id + ".jpg");
						item.write(file);
						request.setAttribute("upload.message", "�ϴ��ļ��ɹ���");
					} else {
						request.setAttribute("upload.message", "û��ѡ���ϴ��ļ���");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("upload.message", "�ϴ��ļ�ʧ�ܣ�");
		}
		request.getRequestDispatcher("/admin/uploadResult.jsp").forward(request, response);
	}
}