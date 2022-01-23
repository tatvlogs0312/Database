package Controller;

import ConnectJDBC.ConnectJDBC;
import Film.Film;
import Service.Service;

import java.sql.Connection;
import java.util.ArrayList;
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

    public void getFilm(){
        ArrayList<Film> list = service.getFilm(conn);
        for(Film film : list){
            System.out.println(film);
        }
    }

    public void getFilmActor(){
        service.filmActor(conn);
    }

    public void getFilmTitle(){
        System.out.print("Nhập tên phim muốn tìm : ");
        String title = sc.nextLine();
        service.searchByTitle(conn,title);
    }
}
