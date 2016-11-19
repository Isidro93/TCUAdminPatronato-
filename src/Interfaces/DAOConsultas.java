package Interfaces;

/**
 *
 * @author Isidro
 */
public interface DAOConsultas {
    
    public void insert(String info);
    public void modificar(String info);
    public void borrar(String info);
    public String consultar(String info);//object
}