package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	private static String banco = "jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "admin";
	private static Connection connection = null;
	
	public static Connection getConnection() {
		return connection;
	}
	 
	static {
		conectar();
	}
	
	public  SingleConnectionBanco() {
		conectar();
	}
	
	private static void conectar() {
		try {
			if (connection == null) {
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(banco, user, senha);
				connection.setAutoCommit(false);//para n�o efetuar alteracoes no banco sem comando
			}
		} catch (Exception e) {
			e.printStackTrace();//Mostrar qualquer erro no momento de conectar
			// TODO: handle exception
		}
	}
	
}
