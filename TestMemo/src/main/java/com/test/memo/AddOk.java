package com.test.memo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.memo.repository.MemoDAO;

@WebServlet("/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// AddOk.java

		req.setCharacterEncoding("UTF-8");

		String name = req.getParameter("name");
		String pw = req.getParameter("pw");
		String memo = req.getParameter("memo");

		MemoDAO dao = new MemoDAO();

		MemoDTO dto = new MemoDTO();
		
		dto.setName(name);
		dto.setPw(pw);
		dto.setMemo(memo);

		int result = dao.add(dto);
		
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/addok.jsp");
		dispatcher.forward(req, resp);
	}
}
