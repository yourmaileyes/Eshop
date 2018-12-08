package com.zzc.webshop.util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.zzc.webshop.entity.Product;
/**
 * 文件上传包装类
 *
 */
public class UploadFile {
		//上传图片存放位置
		private static final String UPLOADImage_DIRECTORY = "public\\img";
		
		// 上传配置
		private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
		private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
		private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
		/**
		 * 方法uploadFile("保存的文件名",HttpServletRequest,HttpServletResponse)
		 * @param refilename
		 * @param request
		 * @param response
		 * @return Product
		 */
		public static Product uploadFile(String refilename,HttpServletRequest request,HttpServletResponse response){
			//程序状态
			boolean isok = true;
			// 检测是否为多媒体上传
	        if (!ServletFileUpload.isMultipartContent(request)) {
	            // 如果不是则停止
	        	System.err.println("Error: 表单必须包含 enctype=multipart/form-data");
	          /*  PrintWriter writer = response.getWriter();
	            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
	            writer.flush();*/
	            return null;
	        }
	 
	        // 配置上传参数
	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
	        factory.setSizeThreshold(MEMORY_THRESHOLD);
	        // 设置临时存储目录
	        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
	 
	        ServletFileUpload upload = new ServletFileUpload(factory);
	         
	        // 设置最大文件上传值
	        upload.setFileSizeMax(MAX_FILE_SIZE);
	         
	        // 设置最大请求值 (包含文件和表单数据)
	        upload.setSizeMax(MAX_REQUEST_SIZE);

	        // 中文处理
	        upload.setHeaderEncoding("UTF-8"); 

	        // 构造临时路径来存储上传的文件
	        // 这个路径相对当前应用的目录
	        String uploadImagePath = request.getServletContext().getRealPath("/") + File.separator + UPLOADImage_DIRECTORY;
	       
	         
	        // 如果目录不存在则创建
	        File uploadImageDir = new File(uploadImagePath);
	        if (!uploadImageDir.exists()) {
	        	uploadImageDir.mkdir();
	        }
	        Product product = new Product();
            Map<String,String> pmap = new HashMap<>();
	        try {
	            // 解析请求的内容提取文件数据
	            @SuppressWarnings("unchecked")
	            List<FileItem> formItems = upload.parseRequest(request);
	            if (formItems != null && formItems.size() > 0) {
	                // 迭代表单数据
	                for (FileItem item : formItems) { 
	                	//处理表单字段
	                	if(item.isFormField()) {
	                		pmap.put(item.getFieldName(), item.getString("utf-8"));
	                	}
	                    
	                }
	                for (FileItem item : formItems) { 
	                	// 处理不在表单中的字段
	                    if (!item.isFormField()) {
	                        String fileName = new File(item.getName()).getName();
	                        String fileExtName = fileName.substring(fileName.lastIndexOf(".")+1);
	                        String filePath = uploadImagePath + File.separator + refilename+"."+fileExtName;
	                        if(pmap.get("ttype")!=null) {
	                        filePath = uploadImagePath + File.separator + pmap.get("productid")+"."+fileExtName;
	                        }
	                        File storeFile = new File(filePath);
	                        // 在控制台输出文件的上传路径
	                        System.out.println(filePath);
	                        // 保存文件到硬盘
	                        item.write(storeFile);
	                        System.out.println("文件上传成功!");
	                        /*request.setAttribute("message",
	                            "文件上传成功!");*/
	                    }
	                }
	                
	                
	            }
	        } catch (Exception ex) {
	        	System.err.println( "错误信息: " + ex.getMessage());
	        	isok = false;
	           /* request.setAttribute("message",
	                    "错误信息: " + ex.getMessage());*/
	        }
	        if(pmap.get("ttype")!=null&&pmap.get("ttype").equals("0")) {
	        	product.setProductid(Integer.valueOf(pmap.get("productid")));
	        }
	        if(!(pmap.get("ttype")!=null&&pmap.get("ttype").equals("0"))) {
	         product.setProductid(Integer.valueOf(refilename));
	        }
	        product.setName(pmap.get("name"));
	        product.setPrice(Integer.valueOf(pmap.get("price")));
	        product.setAddr(pmap.get("addr"));
	        product.setContext(pmap.get("context"));
	        product.setType(Integer.valueOf(pmap.get("type")));
	        product.setTtype(pmap.get("ttype"));
	        return product;
		}
}
