/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
Contreras Gonzalez Diego Alejandro 4IM7
 */
package conexion;

import com.mysql.cj.jdbc.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


/**
 *
 * @author Usuario
 */
public class Base {

    private String usrBD;
    private String passBD;
    private String urlBD;
    private String driverClassName;
    private Connection conn = null;

    public Base() {
        this.usrBD = "root";
        this.passBD = "n0m3l0";
        this.urlBD = "jdbc:mysql://127.0.0.1:3306/STEM";
        this.driverClassName = "com.mysql.jdbc.Driver";
    }

    public String getUsrBD() {
        return usrBD;
    }

    public void setUsrBD(String usrBD) {
        this.usrBD = usrBD;
    }

    public String getPassBD() {
        return passBD;
    }

    public void setPassBD(String passBD) {
        this.passBD = passBD;
    }

    public String getUrlBD() {
        return urlBD;
    }

    public void setUrlBD(String urlBD) {
        this.urlBD = urlBD;
    }

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void conectar() {
        try {
            Class.forName(this.driverClassName).newInstance();
            this.conn = DriverManager.getConnection(this.urlBD, this.usrBD, this.passBD);
        } catch (Exception error) {
            System.out.println("Error" + error.getMessage());
        }
    }

    public void cierraConexion() throws SQLException{
        this.conn.close();
    }
    
    public int insertar(String inserta) throws SQLException{
        Statement st = (Statement) this.conn.createStatement();
        return st.executeUpdate(inserta);
    }
    
    public ResultSet consulta(String consulta) throws SQLException {
        Statement st = (Statement) this.conn.createStatement();
        return st.executeQuery(consulta);
    }
    
    public int edita(String editar) throws SQLException{
        Statement st =(Statement) this.conn.createStatement();
        return st.executeUpdate(editar);
    }

    public String ejecutarProcedimiento(String sql) throws SQLException {
        com.mysql.cj.jdbc.CallableStatement stmt = null;
        ResultSet rs = null;
        String mensaje = "";
        try {
            stmt = (com.mysql.cj.jdbc.CallableStatement) this.conn.prepareCall(sql);
            rs = stmt.executeQuery();
            if (rs.next()) {
                mensaje = rs.getString("Mensaje");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
        }
        return mensaje;
    }
}
