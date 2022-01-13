## _1 Lấy ra thông tin các diễn viễn đóng phim ACADEMY DINOSAUR_

```sql
SELECT *
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
WHERE film_actor.film_id = (SELECT film_id FROM film WHERE title = 'ACADEMY DINOSAUR')
```

## _2 Lấy ra title, description, release_year, length, rating của các bộ phim có rating là G, đếm xem mỗi phim có bao nhiêu diễn viên tham gia_

```sql
SELECT title, description, length , rating, COUNT(actor.actor_id) AS 'Tổng số diễn viên'
FROM film
LEFT JOIN film_actor ON film.film_id = film_actor.film_id
LEFT JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE rating = 'G'
GROUP BY (film.film_id);
```

## _Tính trung bình cộng rental_rate của các phim có CHRISTIAN GABLE tham gia_

```sql
SELECT AVG(rental_rate) AS 'Đánh giá trung bình'
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id = (SELECT actor.actor_id FROM actor WHERE actor.first_name = 'CHRISTIAN' AND actor.last_name = 'GABLE')
```
