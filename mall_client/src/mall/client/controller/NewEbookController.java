package mall.client.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mall.client.model.EbookDao;
import mall.client.vo.Ebook;


@WebServlet("/EbookCalendarController")
public class NewEbookController extends HttpServlet {
	private EbookDao ebookDao; //이달의 신간
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.ebookDao = new EbookDao();
		// 년/월이 매개값으로 전달되지 않으면
		Calendar dday = Calendar.getInstance();
				
		if(request.getParameter("currentYear") != null) {
			dday.set(Calendar.YEAR, Integer.parseInt(request.getParameter("currentYear")));
		}
		if(request.getParameter("currentMonth") != null) {
			dday.set(Calendar.MONTH, Integer.parseInt(request.getParameter("currentMonth"))-1);
		}
		int currentYear = dday.get(Calendar.YEAR);
		int currentMonth = dday.get(Calendar.MONTH)+1;
		
		//1일의 요일
		Calendar firstDay = Calendar.getInstance();
		firstDay.set(Calendar.YEAR, currentYear);
		firstDay.set(Calendar.MONTH, currentMonth-1);
		firstDay.set(Calendar.DATE, 1);
		int firstDayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);
		
		//마지막 일 31 ,30 ,28
		int endDay = dday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		
		/*
		Calendar cal = Calendar.getInstance();
		for(int i = 0; i < 12; i++) {
			cal.set(currentYear,i,1);
			System.out.println(currentYear+"년"+ (i+1) +"월은"+cal.getActualMaximum(Calendar.DAY_OF_MONTH)+"일");
		}
		*/
		
		System.out.println(currentYear + "<----currentYear");
		System.out.println(currentMonth + "<----currentMonth");
		System.out.println(firstDayOfWeek + "<----firstDayOfWeek");
		System.out.println(endDay + "<----endDay");
		
		List<Map<String, Object>> ebookListByMonth = this.ebookDao.selectEbookListByMonth(currentYear, currentMonth);
		
		request.setAttribute("ebookListByMonth", ebookListByMonth);
		request.setAttribute("firstDayOfWeek", firstDayOfWeek);
		request.setAttribute("endDay", endDay);
		request.setAttribute("currentYear", currentYear);
		request.setAttribute("currentMonth", currentMonth);
		request.getRequestDispatcher("/WEB-INF/view/ebook/ebookCalendar.jsp").forward(request, response);
	}

}
