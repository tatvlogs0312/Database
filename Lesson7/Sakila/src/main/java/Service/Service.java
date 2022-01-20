package Service;

import Film.Film;

import java.sql.*;

public class Service {
    public Film getFilm(Connection conn){
        Film film = null;

        String query = "SELECT title, description, release_year, length, rating,JSON_ARRAYAGG(name) \n" +
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
                Array category = rs.getArray("JSON_ARRAYAGG(name)");

                film = new Film(title,description,release_year,length,rating, (String[]) category.getArray());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return film;
    }
}
