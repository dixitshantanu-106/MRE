package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Hcustomer;

/**
 * Servlet implementation class HcustomerPhnValidate
 */
public class HcustomerPhnValidate extends HttpServlet {
	long phn;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HcustomerPhnValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		phn = Long.parseLong(request.getParameter("phn"));
		Hcustomer hc = new Hcustomer();
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		try
		{
			if(hc.checkPhn(phn))
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

}
