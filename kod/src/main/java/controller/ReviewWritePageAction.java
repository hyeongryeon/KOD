package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.util.Action;
import controller.util.ActionForward;

public class ReviewWritePageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		forward.setPath("reviewWrite.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
