package Controller;

import ConnectJDBC.ConnectJDBC;
import Film.Film;
import Service.Service;

import java.sql.Connection;
import java.util.Scanner;

public class Controller {
    Service service;
    ConnectJDBC connectJDBC;
    Connection conn;
    Scanner sc;

    public Controller(){
        service = new Service();
        connectJDBC = new ConnectJDBC();
        conn = connectJDBC.connect();
        sc = new Scanner(System.in);
    }

    public void show(){
        Film film = service.getFilm(conn);
        System.out.println(film);
    }
}
