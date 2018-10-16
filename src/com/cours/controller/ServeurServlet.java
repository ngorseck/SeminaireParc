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
import com.cours.dao.ServeurImpl;
import com.cours.entities.Serveur;

/**
 * Servlet implementation class ServeurServlet
 */
@WebServlet("/Serveur")
public class ServeurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private IServeur serveur_dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServeurServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		serveur_dao = new ServeurImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("page") != null) {
			String page = request.getParameter("page").toString();
			if(page.equals("delete")) {
				int idServ = Integer.parseInt(request.getParameter("idServ").toString());
				serveur_dao.delete(idServ);
			}
			if(page.equals("edit")) {
				int idServ = Integer.parseInt(request.getParameter("idServ").toString());
				Serveur serveur = serveur_dao.get(idServ);
				request.setAttribute("serveur", serveur);
			}
		}
		
		//Gestion de la liste
		List<Serveur> liste_serveurs = serveur_dao.list();
		request.setAttribute("serveurs", liste_serveurs);
		request.getRequestDispatcher("view/serveur/liste.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("valider") != null) {
			String nom = request.getParameter("nomServ");
			String adrip = request.getParameter("adripServ");
			String salle = request.getParameter("salleServ");
			
			Serveur serveur = new Serveur();
			serveur.setNomServ(nom);
			serveur.setAdripServ(adrip);
			serveur.setSalleServ(salle);
			//Ajout
			if(request.getParameter("valider").equals("Valider")) {
				serveur_dao.add(serveur);
			}
			//Modification
			if(request.getParameter("valider").equals("Modifier")) {
				int id = Integer.parseInt(request.getParameter("id"));
				serveur.setIdServ(id);
				serveur_dao.update(serveur);
			}
			doGet(request, response);
		}
	}

}
