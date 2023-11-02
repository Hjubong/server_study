<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.*"%>

<%
	//download.jsp?filename=cat1.png&orgfilename=cat.png

	String fileName = request.getParameter("filename");
	String orgfileName = request.getParameter("orgfilename");

	String savePath = "files"; //첨부파일 폴더의 경로: webapp > files
	ServletContext context = getServletContext();
	String sDownloadPath = context.getRealPath(savePath);


	String sFilePath = sDownloadPath + "/" + fileName;
	byte b[] = new byte[4096];
	FileInputStream in = new FileInputStream(sFilePath);
	String sMimeType = getServletContext().getMimeType(sFilePath);
	System.out.println("sMimeType>>>" + sMimeType);

	if (sMimeType == null)
		sMimeType = "application/octet-stream";//MIME. 브라우저에게 해석할 수 없는 데이터라고 타입을 속여서 보내는 작업 중 하나

	response.setContentType(sMimeType);
	String agent = request.getHeader("User-Agent");
	boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

	if (ieBrowser) {
		orgfileName = URLEncoder.encode(orgfileName, "UTF-8").replaceAll("/+", "%20");
	} else {
		orgfileName = new String(orgfileName.getBytes("UTF-8"), "iso-8859-1");
	}

	response.setHeader("Content-Disposition", "attachment; filename= " + orgfileName);

	ServletOutputStream out2 = response.getOutputStream();
	int numRead;

	while ((numRead = in.read(b, 0, b.length)) != -1) {
		out2.write(b, 0, numRead);
	}
	
	out2.flush();
	out2.close();
	in.close();
%>












