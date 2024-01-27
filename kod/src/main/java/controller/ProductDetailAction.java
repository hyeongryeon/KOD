package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.WishListDAO;
import model.dto.MemberDTO;
import model.dto.WishListDTO;

public class ProductDetailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		ActionForward forward = new ActionForward();
		forward.setPath("productDetail.jsp");
		forward.setRedirect(false);

		System.out.println("프로덕트디테일액션 들어옴");
		System.out.println("상품ID"+Integer.parseInt(request.getParameter("productID")));
		System.out.println("상품카테고리"+(String)request.getParameter("productCategory"));
		
		HttpSession session = request.getSession();
		String memberID = null;
		try {
			memberID = ((MemberDTO)session.getAttribute("memberDTO")).getMemberID();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		WishListDTO productWishDetailData = null;
		ArrayList<WishListDTO> productWishDatas = null;
		ArrayList<WishListDTO> recommendationByAgeDatas=null;
		int wishListCnt=0;

		if(memberID==null) {
			WishListDAO wishListDAO = new WishListDAO();
			WishListDTO wishListDTO = new WishListDTO();
			wishListDTO.setSearchCondition("상품상세페이지LOGOUT");
			wishListDTO.setProductID(Integer.parseInt(request.getParameter("productID")));
			productWishDetailData = wishListDAO.selectOne(wishListDTO);
			productWishDatas = new ArrayList<WishListDTO>();
			wishListDTO.setSearchCondition("연관상품LOGOUT");
			wishListDTO.setProductID(Integer.parseInt(request.getParameter("productID")));
			wishListDTO.setProductCategory((String)request.getParameter("productCategory"));
			System.out.println("DTO에 카테고리 담겼니 ?ㅇㅇ "+wishListDTO.getProductCategory());
			productWishDatas = wishListDAO.selectAll(wishListDTO);

		}
		else {
			WishListDAO wishListDAO = new WishListDAO();
			WishListDTO wishListDTO = new WishListDTO();
			wishListDTO.setSearchCondition("상품상세페이지LOGIN");
			wishListDTO.setProductID(Integer.parseInt(request.getParameter("productID")));
			wishListDTO.setMemberID(memberID);
			productWishDetailData = wishListDAO.selectOne(wishListDTO);
//			wishListDTO.setSearchCondition("연관상품LOGIN");
//			wishListDTO.setProductCategory((String)request.getParameter("productCategory"));
//			wishListDTO.setMemberID(memberID);
//			productWishDatas = wishListDAO.selectAll(wishListDTO);
			wishListDTO.setSearchCondition("찜수량");
			wishListDTO.setMemberID(memberID);
			wishListDTO = wishListDAO.selectOne(wishListDTO);
			wishListCnt = wishListDTO.getWishListCnt();
			
			wishListDTO.setSearchCondition("나이");
			wishListDTO.setMemberID(memberID);
			WishListDTO memberMinMaxAge = wishListDAO.selectOne(wishListDTO);
			wishListDTO.setSearchCondition("연관상품LOGIN버전2");
			wishListDTO.setProductID(Integer.parseInt(request.getParameter("productID")));
			wishListDTO.setMemberMinAge(memberMinMaxAge.getMemberMinAge());
			wishListDTO.setMemberMaxAge(memberMinMaxAge.getMemberMaxAge());
			productWishDatas = wishListDAO.selectAll(wishListDTO);
			
		}    
		
		WishListDAO wishListDAO = new WishListDAO();
		WishListDTO wishListDTO = new WishListDTO();
		wishListDTO.setSearchCondition("찜합계");
		wishListDTO.setProductID(Integer.parseInt(request.getParameter("productID")));
		wishListDTO=wishListDAO.selectOne(wishListDTO);
		int wishTotalCnt = wishListDTO.getWishTotalCnt();
		
		for (WishListDTO data : productWishDatas) {
			System.out.println("삐용삐용삐용삐용삐용삐용삐용삐용삐용삐용");
//			System.out.println("data로그 : "+data.getProductName());
			System.out.println(data.getIsWished());
		}
		
		request.setAttribute("productWishDetailData", productWishDetailData);
		request.setAttribute("productWishDatas", productWishDatas);
		request.setAttribute("wishListCnt", wishListCnt);
		request.setAttribute("wishTotalCnt", wishTotalCnt);

		return forward;
	}
}
