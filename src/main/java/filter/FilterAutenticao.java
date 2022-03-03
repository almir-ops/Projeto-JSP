package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpSession;

import connection.SingleConnectionBanco;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@WebFilter(urlPatterns = {"/principal/*"})// WebFilter intercepta todas as requisi��es que vierem do projeto 
public class FilterAutenticao implements Filter {

	private static Connection connection;
	
    public FilterAutenticao() {
    }

	
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	
		try {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String usuarioLogado = (String) session.getAttribute("usuario");
		
		String urlParaAutenticar = req.getServletPath();//Url que esta sendo acessada
		
		//Validar se esta logado se nao redireciona para a tela login
		if (usuarioLogado == null || (usuarioLogado != null && usuarioLogado.isEmpty()) && !urlParaAutenticar.contains("/principal/ServletLogin")) {
			
			RequestDispatcher redireciona = (RequestDispatcher) request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
			request.setAttribute("msg", "Realize o login para seguir.");
			redireciona.forward(request, response);
			return;//Para execu��o e redireciona para o login
		}else {
		
		chain.doFilter(request, response);
		}
		connection.commit();
	}catch(Exception e) {
		e.printStackTrace();
		RequestDispatcher redirecionar = request.getRequestDispatcher("/erro.jsp");
		request.setAttribute("msg", e.getMessage());
		redirecionar.forward(request, response);
		try {
			connection.rollback();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		}
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();
	}

}
