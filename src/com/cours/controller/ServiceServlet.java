package com.cours.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cours.dao.IServeur;
import com.cours.dao.IService;
import com.cours.dao.ServeurImpl;
import com.cours.dao.ServiceImpl;
import com.cours.entities.Serveur;
import com.cours.entities.Service;

/**
 * Servlet implementation class ServiceServlet
 */
@WebServlet("/Service")
public class ServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IService service_dao; 
    private IServeur serveur_dao; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		service_dao = new ServiceImpl();
		serveur_dao = new ServeurImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("page") != null){
			String page = request.getParameter("page").toString();
			if(page.equals("delete")){
				int idS = Integer.parseInt(request.getParameter("idS").toString());
				service_dao.delete(idS);
			}
			if(page.equals("edit")){
				int idS = Integer.parseInt(request.getParameter("idS").toString());
				Service service = service_dao.get(idS);
				request.setAttribute("service", service); 
			}
		} 
		
		List<Service> liste_services = service_dao.list();
		request.setAttribute("services", liste_services);
		
		List<Serveur> liste_serveurs = serveur_dao.list();
		request.setAttribute("serveurs", liste_serveurs);
		
		request.getRequestDispatcher("view/service/liste.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("valider") !=null){
			String nom = request.getParameter("nomS");
			int port = Integer.parseInt(request.getParameter("port"));
			int idServ = Integer.parseInt(request.getParameter("serveur"));
			Serveur serveur = new Serveur();
			serveur.setIdServ(idServ);
			
			Service service = new Service();
			service.setNomS(nom);
			service.setPort(port);
			service.setServeur(serveur);
			if(request.getParameter("valider").equals("Valider")){
			service_dao.add(service);
			}
			if(request.getParameter("valider").equals("Modifier")){
				int id = Integer.parseInt(request.getParameter("id"));
				service.setIdS(id);;
					service_dao.update(service);
						
			}
				
			doGet(request, response);
		}
	}

}
