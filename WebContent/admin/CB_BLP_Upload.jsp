<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
	if (FileUpload.isMultipartContent(request)) { 

		String temDir = "/blueprint"; 
		DiskFileUpload fileUpload = new DiskFileUpload();
		fileUpload.setRepositoryPath(temDir);
		fileUpload.setSizeMax(1024 * 1024*10);
		fileUpload.setSizeThreshold(1024 * 100);

		if (request.getContentLength() < fileUpload.getSizeMax()) {

			List fileItemList = fileUpload.parseRequest(request);

			int Size = fileItemList.size(); 
			for (int i = 0; i < Size; i++) {
				FileItem fileItem = (FileItem) fileItemList.get(i);
				if (fileItem.isFormField()) {
					out.print("폼 파라미터 : " + fileItem.getFieldName() + " = " + fileItem.getString("UTF-8")
							+ "<br>");
				} else { // 파일형식이면..
					out.print("파일 : " + fileItem.getFieldName() + " = " + fileItem.getName());
					out.print("(" + fileItem.getSize() + " byte)<br>");
					if (fileItem.isInMemory()) { // 메모리에 저장중이면 true, 아니면 false
						out.print("메모리에 저장<br>");
					} else {
						out.print("디스크에 저장<br>");
					}
					if (fileItem.getSize() > 0) { // 파일 저장
						int idx = fileItem.getName().lastIndexOf("\\");
						if (idx == -1) {
							idx = fileItem.getName().lastIndexOf("/");
						}
						String fileName = fileItem.getName().substring(idx + 1);
						try {
							File uploadedFile = new File(temDir, fileName);
							fileItem.write(uploadedFile);
						} catch (IOException e) {
							System.out.println(e);
						}
					}
				} //else
			} //for
		} else { 
			int overSize = (request.getContentLength() / 1000000);
			out.print("<script>alert('파일의 크기는 10MB까지 입니다. 올리신 파일 용량은" + overSize + "MB입니다');");
			out.print("history.back();</script>");
		}
	} else {
		out.print("인코딩 타입이 multipart/form-data가 아닙니다");
	}
%>
