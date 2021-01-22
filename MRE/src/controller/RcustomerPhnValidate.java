package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Rcustomer;

/**
 * Servlet implementation class RcustomerPhnValidate
 */
public class RcustomerPhnValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       long phn;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RcustomerPhnValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		phn = Long.parseLong(request.getParameter("phn"));
		Rcustomer rc = new Rcustomer();
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		try
		{
			if(rc.checkPhn(phn))
			{
				out.print("\"An account linked to this phone-number already exists\"");
			}
			else
			{
				out.print(true);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
