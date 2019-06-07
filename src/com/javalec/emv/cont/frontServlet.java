package com.javalec.emv.cont;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class frontServlet
 */
@WebServlet("*.do")
public class frontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public frontServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGET");
		actionDo(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPOST");
		actionDo(request, response);
	}
	
	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDO");
		
		request.setCharacterEncoding("EUC-KR");
		
		String viewPage = null;		// � �並 ���� ���� �� ��ü
		//BCommand command = null;	// � ������ �������� Ŀ�ǵ� ��ü
		
		String uri = request.getRequestURI();		// ����ڰ� ��û�� URL
		String conPath = request.getContextPath();		// ContextPath
		String com = uri.substring(conPath.length());	// ContextPath�� �߶�
		
		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);
		
		
		if(com.equals("/write_view.do")) {
			viewPage = "write_view.jsp";
		} 
		else if(com.equals("/write.do")) {
			viewPage = "list.do";
		} 
		else if(com.equals("/list.do")) {
			viewPage = "list.jsp";
		} 
		else if(com.equals("/content_view.do")) {
			viewPage = "content_view.jsp";
		} 
		else if(com.equals("/modify.do")) {
			viewPage = "list.do";
		} 
		else if(com.equals("/delete.do")) {
			viewPage = "list.do";
		} 
		else if(com.equals("/reply_view.do")) {
			viewPage = "reply_view.jsp";
		} 
		else if(com.equals("/reply.do")) {
			viewPage = "list.do";
		}
		else if(com.equals("/view/test.do")) {
			viewPage = "testView.jsp";
		}
		
		// ������ ���(ȭ�� ��ȯ)
		RequestDispatcher  dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}

}