package Service;

import Film.Film;

import java.sql.*;
import java.util.ArrayList;

public class Service {
    //Cách 1
    public ArrayList<Film> getFilm(Connection conn){
        ArrayList<Film> film = new ArrayList<>();

        String query = "SELECT title, description, release_year, length, rating,JSON_ARRAYAGG(name) AS 'category' \n" +
                "FROM film\n" +
                "INNER JOIN film_category ON film.film_id = film_category.film_id\n" +
                "INNER JOIN category ON film_category.category_id = category.category_id\n" +
                "WHERE rating = 'PG'\n" +
                "GROUP BY film.film_id" ;

        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()){
                String title = rs.getString("title");
                String description = rs.getString("description");
                int release_year = rs.getInt("release_year");
                int length = rs.getInt("length");
                String rating = rs.getString("rating");
                String category = rs.getString("category");

                film.add(new Film(title,description,release_year,length,rating,category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return film;
    }

//        Cách 2

//        public void getFilm(Connection conn){
//
//        String query = "SELECT title, description, release_year, length, rating,JSON_ARRAYAGG(name) \n" +
//                "FROM film\n" +
//                "INNER JOIN film_category ON film.film_id = film_category.film_id\n" +
//                "INNER JOIN category ON film_category.category_id = category.category_id\n" +
//                "WHERE rating = 'PG'\n" +
//                "GROUP BY film.film_id" ;
//
//        try {
//            Statement stm = conn.createStatement();
//            ResultSet rs = stm.executeQuery(query);
//            while (rs.next()){
//                System.out.print("title : " + rs.getString("title"));
//                System.out.print("\t description : " + rs.getString("description"));
//                System.out.print("\t release_year : " + rs.getInt("release_year"));
//                System.out.print("\t length : " + rs.getInt("length"));
//                System.out.print("\t rating : " + rs.getString("rating"));
//                System.out.println("\t category : " + rs.getString("JSON_ARRAYAGG(name)"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }


    public void filmActor(Connection conn){
        String query = "SELECT title , first_name , last_name\n" +
                "FROM film\n" +
                "INNER JOIN film_actor ON film.film_id = film_actor.film_id\n" +
                "INNER JOIN actor ON film_actor.actor_id = actor.actor_id\n" +
                "WHERE title LIKE '%ACADEMY%'";

        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()){
                System.out.print("title : " + rs.getString("title"));
                System.out.print("\t first name : " + rs.getString("first_name"));
                System.out.println("\t last name : " + rs.getString("last_name"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void searchByTitle(Connection conn,String title){
        String query = "SELECT * FROM film\n" +
                "WHERE title LIKE '%" + title + "%'";
        try {
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(query);
            while (rs.next()){
                System.out.print("id : " + rs.getInt("film_id"));
                System.out.print("\t title : " + rs.getString("title"));
                System.out.print("\t description : " + rs.getString("description"));
                System.out.print("\t release_year : " + rs.getInt("release_year"));
                System.out.print("\t original_language_id : " + rs.getInt("original_language_id"));
                System.out.print("\t rental_duration : " + rs.getInt("rental_duration"));
                System.out.print("\t language_id : " + rs.getInt("language_id"));
                System.out.print("\t rental_rate : " + rs.getDouble("rental_rate"));
                System.out.print("\t length : " + rs.getInt("length"));
                System.out.print("\t replacement_cost : " + rs.getDouble("replacement_cost"));
                System.out.print("\t rating : " + rs.getString("rating"));
                System.out.print("\t special_features : " + rs.getString("special_features"));
                System.out.println("\t last_update : " + rs.getString("last_update"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
