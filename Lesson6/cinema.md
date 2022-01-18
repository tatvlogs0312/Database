### tạo bảng

bảng thể loại

```sql
CREATE TABLE category(
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category TEXT NOT NULL
);
```

bảng nhà sản xuất

```sql
CREATE TABLE producer(
	producer_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    email TEXT NOT NULL
)
```

bảng tác giả

```sql
CREATE TABLE author(
	author_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    age TEXT NOT NULL
)
```

bảng film

```sql
CREATE TABLE film(
	film_id INT PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    length INT NOT NULL,
    poster TEXT NOT NULL,
    release_year INT NOT NULL,
    author_id INT NOT NULL,
    producer_id INT NOT NULL,
    CONSTRAINT fk_film_author FOREIGN KEY (author_id) REFERENCES author(author_id),
    CONSTRAINT fk_film_producer FOREIGN KEY (producer_id) REFERENCES producer(producer_id)
)
```

bảng trailer

```sql
CREATE TABLE trailer(
	trailer_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT NOT NULL,
    name TEXT NOT NULL,
    video TEXT NOT NULL,
    CONSTRAINT fk_trailer_film FOREIGN KEY (film_id) REFERENCES film(film_id)
)
```

bảng diễn viên

```sql
CREATE TABLE actor(
	actor_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL
)
```

bảng phim thể loại

```sql
CREATE TABLE film_category(
	film_id INT NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT pr_film_category PRIMARY KEY (film_id,category_id),
    CONSTRAINT fk_film_category_film FOREIGN KEY (film_id) REFERENCES film(film_id),
    CONSTRAINT fk_film_category_category FOREIGN KEY (category_id) REFERENCES category(category_id)
)
```

bảng phim diễn viên

```sql
CREATE TABLE film_actor(
	film_id INT NOT NULL,
    actor_id INT NOT NULL,
    CONSTRAINT pr_film_actor PRIMARY KEY (film_id,actor_id),
    CONSTRAINT fk_film_actor_film FOREIGN KEY (film_id) REFERENCES film(film_id),
    CONSTRAINT fk_film_actor_actor FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
)
```

bảng phòng

```sql
CREATE TABLE room(
	room_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    position TEXT NOT NULL
)
```

bảng lịch chiếu film

```sql
CREATE TABLE showtimes(
	showtimes_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT NOT NULL,
    room_id INT NOT NULL,
    movie_showtime DATETIME NOT NULL,
    CONSTRAINT fk_showtimes_film FOREIGN KEY (film_id) REFERENCES film(film_id),
    CONSTRAINT fk_showtimes_room FOREIGN KEY (room_id) REFERENCES room(room_id)
)
```

bảng chỗ ngồi

```sql
CREATE TABLE seat(
	seat_id INT PRIMARY KEY AUTO_INCREMENT,
    room_id INT NOT NULL,
    `column` INT NOT NULL,
    `row` VARCHAR(5) NOT NULL,
    status ENUM ('còn trống','đã có người'),
    CONSTRAINT fk_seat_room FOREIGN KEY (room_id) REFERENCES room(room_id)
)
```

bảng nhân viên

```sql
CREATE TABLE personnel(
	personnel_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    age INT NOT NULL,
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    position TEXT NOT NULL
)
```

bảng ca làm việc

```sql
CREATE TABLE shift(
	shift_id INT PRIMARY KEY AUTO_INCREMENT,
    shift_name TEXT NOT NULL,
    start_time INT NOT NULL,
    working_time INT NOT NULL,
    wage BIGINT NOT NULL
)
```

bảng lương

```sql
CREATE TABLE payroll(
	payroll_id INT PRIMARY KEY AUTO_INCREMENT,
    personnel_id INT NOT NULL,
    shift_id INT NOT NULL,
    month ENUM('1','2','3','4','5','6','7','8','9','10','11','12'),
    CONSTRAINT fk_payroll_personnel FOREIGN KEY (personnel_id) REFERENCES personnel(personnel_id),
    CONSTRAINT fk_payroll_shift FOREIGN KEY (shift_id) REFERENCES shift(shift_id)
)
```

bảng thưởng

```sql
CREATE TABLE bonus(
	bonus_id INT PRIMARY KEY AUTO_INCREMENT,
    reason_bonus TEXT NOT NULL,
    bonus BIGINT NOT NULL
)
```

bảng lương- thưởng

```sql
CREATE TABLE payroll_bonus(
	payroll_bonus_id INT PRIMARY KEY AUTO_INCREMENT,
    payroll_id INT NOT NULL,
    bonus_id INT NOT NULL,
    bonus_date DATE ,
    CONSTRAINT fk_payroll_bonus_payroll FOREIGN KEY (payroll_id) REFERENCES payroll(payroll_id),
    CONSTRAINT fk_payroll_bonus_bonus FOREIGN KEY (bonus_id) REFERENCES bonus(bonus_id)
)
```

bảng phạt

```sql
CREATE TABLE punish(
	punish_id INT PRIMARY KEY AUTO_INCREMENT,
    reason_punish TEXT NOT NULL,
    punish BIGINT NOT NULL
)
```

bảng lương - phạt

```sql
CREATE TABLE payroll_punish(
	payroll_punish_id INT PRIMARY KEY AUTO_INCREMENT,
    payroll_id INT NOT NULL,
    punish_id INT NOT NULL,
    punish_date DATE ,
    CONSTRAINT fk_payroll_punish_payroll FOREIGN KEY (payroll_id) REFERENCES payroll(payroll_id),
    CONSTRAINT fk_payroll_punish_punish FOREIGN KEY (punish_id) REFERENCES punish(punish_id)
)
```

bảng loại vé

```sql
CREATE TABLE ticket_type(
	ticket_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    price BIGINT NOT NULL
)
```

bảng khách hàng

```sql
CREATE TABLE customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    customer_type ENUM ('hội viên','vô danh')
)
```

bảng vé

```sql
CREATE TABLE ticket(
	ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    film_id INT NOT NULL,
    customer_id INT ,
    seat_id INT NOT NULL,
    ticket_type_id INT NOT NULL,
    shelf_life DATE NOT NULL,
    personnel_id INT NOT NULL,
    CONSTRAINT fk_ticket_film FOREIGN KEY (film_id) REFERENCES film(film_id),
    CONSTRAINT fk_ticket_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_ticket_seat FOREIGN KEY (seat_id) REFERENCES seat(seat_id),
    CONSTRAINT fk_ticket_ticket_type FOREIGN KEY (ticket_type_id) REFERENCES ticket_type(ticket_type_id)
    CONSTRAINT fk_ticket_personnel FOREIGN KEY (personnel_id) REFERENCES personnel(personnel_id)
)
```

bảng hóa đơn

```sql
CREATE TABLE hoadon(
	hoadon_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    personnel_id INT NOT NULL,
    price BIGINT NOT NULL,
    CONSTRAINT fk_hoadon_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_hoadon_personnel FOREIGN KEY (personnel_id) REFERENCES personnel(personnel_id)
)
```

bảng mặt hàng

```sql
CREATE TABLE items(
	items_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    size VARCHAR(5) NOT NULL,
    price BIGINT NOT NULL
)
```

bảng chi tiết hóa đơn

```sql
CREATE TABLE cthoadon(
	cthoadon_id INT PRIMARY KEY AUTO_INCREMENT,
    hoadon_id INT NOT NULL,
    items_id INT NOT NULL,
    amount INT NOT NULL,
    price INT NOT NULL,
    CONSTRAINT fk_cthoadon_hoadon FOREIGN KEY (hoadon_id) REFERENCES hoadon(hoadon_id),
    CONSTRAINT fk_cthoadon_items FOREIGN KEY (items_id) REFERENCES items(items_id)
)
```

bảng nguyên liệu

```sql
CREATE TABLE ingredient(
	ingredient_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    dvtinh TEXT NOT NULL,
    expired_date DATE
)
```

bảng mặt hàng - nguyên liệu

```sql
CREATE TABLE items_ingredient(
	items_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    CONSTRAINT pr_items_ingredient PRIMARY KEY (items_id,ingredient_id),
    CONSTRAINT fk_items_ingredient_items FOREIGN KEY (items_id) REFERENCES items(items_id),
    CONSTRAINT fk_items_ingredient_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
)
```

bảng nhà cung cấp

```sql
CREATE TABLE supplier(
	supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL
)
```

bảng phiếu nhập

```sql
CREATE TABLE phieunhap(
	phieunhap_id INT PRIMARY KEY AUTO_INCREMENT,
    personnel_id INT NOT NULL,
    supplier_id INT NOT NULL,
    ngay_nhap DATE NOT NULL,
    CONSTRAINT fk_phieunhap_personnel FOREIGN KEY (personnel_id) REFERENCES personnel(personnel_id),
    CONSTRAINT fk_phieunhap_supplier FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
)
```

bảng ctchi tiết phiếu nhập

```sql
CREATE TABLE ctphieunhap(
	ctphieunhap INT PRIMARY KEY AUTO_INCREMENT,
    phieunhap_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    amount FLOAT NOT NULL,
    price BIGINT NOT NULL,
    CONSTRAINT fk_ctphieunhap_phieunhap FOREIGN KEY (phieunhap_id) REFERENCES phieunhap(phieunhap_id),
    CONSTRAINT fk_ctphieunhap_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredient(ingredient_id)
)
```

# thêm dữ liệu

bảng thưởng

```sql
INSERT INTO `bonus`(`bonus_id`, `reason_bonus`, `bonus`) VALUES
	(null,'thưởng tết',1000000),
    (null,'nhân viên xuất sắc',2000000)
```

bảng phạt

```sql
INSERT INTO `punish`(`punish_id`, `reason_punish`, `punish`) VALUES
	(null,'đi muộn',100000),
    (null,'không mặc đồng phục',100000),
    (null,'làm việc riêng trong giờ làm',50000),
    (null,'không vệ sinh chỗ làm',50000)
```

bảng nhân viên

```sql
INSERT INTO `personnel`(`personnel_id`, `name`, `age`, `address`, `mobile`, `email`, `position`) VALUES
    (null,'A',20,'Hà Nội','0123456789','a@gmail.com','nhân viên bán vé'),
    (null,'B',23,'Hà Nội','0123456788','b@gmail.com','nhân viên bán vé'),
    (null,'C',22,'Hà Nội','0123456787','c@gmail.com','nhân viên bán hàng'),
    (null,'D',19,'Hà Nội','0123456786','d@gmail.com','nhân viên bán hàng'),
    (null,'E',21,'Hà Nội','0123456785','e@gmail.com','nhân viên bảo  vệ'),
    (null,'F',28,'Hà Nội','0123456784','f@gmail.com','nhân viên bảo vệ'),
    (null,'G',30,'Hà Nội','0123456783','g@gmail.com','nhân viên bán vé'),
    (null,'H',22,'Hà Nội','0123456782','h@gmail.com','nhân viên tạp vụ')
```

bảng thể loại

```sql
INSERT INTO `category`(`category_id`, `category`) VALUES
	(null,'Action'),
    (null,'Animation'),
    (null,'Comedy'),
    (null,'Horror'),
    (null,'Mystery'),
    (null,'Thriller'),
    (null,'Sci-Fi'),
    (null,'Drama'),
    (null,'Romance'),
    (null,'Documentary'),
    (null,'Adventure'),
    (null,'Fantasy')
```

bảng nhà sản xuất

```sql
INSERT INTO `producer`(`producer_id`, `name`, `address`, `email`) VALUES
	(1,'phima','USA','phima@gmail.com'),
    (2,'phimb','England','phimb@gmail.com'),
    (3,'phimc','American','phimc@gmail.com'),
    (4,'phimd','USA','phimd@gmail.com'),
    (5,'phime','Japan','phime@gmail.com'),
    (6,'phimf','China','phimf@gmail.com'),
    (7,'phimg','Korea','phimg@gmail.com')
```

bảng tác giả

```sql
INSERT INTO `author`(`author_id`, `name`, `age`) VALUES
	(1,'author a',40),
    (2,'author b',35),
    (3,'author c',51),
    (4,'author d',43),
    (5,'author e',35)
```

bảng diễn viên

```sql
INSERT INTO `actor`(`actor_id`, `name`) VALUES
	(null,'actor a'),
    (null,'actor b'),
    (null,'actor c'),
    (null,'actor e'),
    (null,'actor f'),
    (null,'actor g'),
    (null,'actor h'),
    (null,'actor i'),
    (null,'actor j'),
    (null,'actor k')
```

bảng film

```sql
INSERT INTO `film`(`film_id`, `title`, `description`, `length`, `poster`, `release_year`, `author_id`, `producer_id`) VALUES
	(null,'Chuyện Quái Dị Âm Dương - The Town Of Ghosts','Chuyện Quái Dị Âm Dương - The Town Of Ghosts',65,'//static.ssphim.net/static/5fe2d564b3fa6403ffa11d1c/61e57100df030855bcb1801a_tran-am-duong.jpg',2021,1,1),
    (null,'Vũ Điệu Dòng Sông: Cuộc Phiêu Lưu - Riverdance: The Animated Adventure','Vũ Điệu Dòng Sông: Cuộc Phiêu Lưu - Riverdance: The Animated Adventure',90,'//static.ssphim.net/static/5fe2d564b3fa6403ffa11d1c/61e4d0a9d80a8b37d10877e1_riverdance.jpg',2021,2,2),
     (null,'Bạn Gái Bán Thời Gian - Part-Time Girlfriend','Bạn Gái Bán Thời Gian - Part-Time Girlfriend',109,'//static.ssphim.net/static/5fe2d564b3fa6403ffa11d1c/61e2d61782000326fa4d8f13_ban-gai.jpg',2021,3,3),
     (null,'Vén Màn Bí Ẩn - Photocopier','Vén Màn Bí Ẩn -  Photocopier',130,'//static.ssphim.net/static/5fe2d564b3fa6403ffa11d1c/61e038fbb5a3717e42b81c58_ven-man.jpg',2021,4,4),
     (null,'Một Ngôi Nhà, Ba Câu Chuyện - The House','Một Ngôi Nhà, Ba Câu Chuyện - The House',97,'//static.ssphim.net/static/5fe2d564b3fa6403ffa11d1c/61e4df9056f0cf690340292a_the-house.jpg',2021,5,5)
```

bảng trailer

```sql
INSERT INTO `trailer`(`trailer_id`, `film_id`, `name`, `video`) VALUES
	(null,1,'The Town of Ghosts (阴阳镇怪谈, 2022) chinese fantasy trailer','https://www.youtube.com/watch?v=tn_Azrxjcrk'),
    (null,2,'Riverdance - The Animated Adventure ','https://www.youtube.com/watch?v=ZN6TgXnNVGQ'),
    (null,3,'Part Time Girlfriend Trailer ','https://youtu.be/ZSs0Dcu63AQ'),
    (null,4,'Photocopier Official Trailer','https://youtu.be/VbsTA-inEkc'),
    (null,5,'The House Official Trailer','https://youtu.be/wqbZlAEUb5w')
```

bảng film - thể loại

```sql
INSERT INTO `film_category`(`film_id`, `category_id`) VALUES
	(1,1),
    (1,7),
    (1,11),
    (2,2),
    (2,11),
    (2,6),
    (3,9),
    (4,4),
    (4,5),
    (4,1),
    (5,2),
    (5,8)
```

bảng film - diễn viên

```sql
INSERT INTO `film_actor`(`film_id`, `actor_id`) VALUES
	(1,1),
    (1,2),
    (3,4),
    (3,5),
    (3,6),
    (3,10),
    (4,6),
    (4,7),
    (4,8),
    (4,10),
    (5,4),
    (5,6),
    (5,7),
    (5,9)
```

bảng phòng

```sql
INSERT INTO `room`(`room_id`, `name`, `position`) VALUES
	(null,'A','Tầng 1'),
    (null,'B','Tầng 1'),
    (null,'C','Tầng 2'),
    (null,'D','Tầng 2')
```

bảng ca làm việc

```sql
INSERT INTO `shift`(`shift_id`, `shift_name`, `start_time`, `working_time`, `wage`) VALUES
	(null,'ca sáng','8','4','3000000'),
    (null,'ca chiều','14','4','3000000'),
    (null,'ca tối','18','4','3000000'),
    (null,'fulltime','8','12','10000000')
```

bảng loại vé

```sql
INSERT INTO `ticket_type`(`ticket_type_id`, `name`, `price`) VALUES
	(null,'bình thường',100000),
    (null,'vip',200000)
```

bảng lịch chiếu film

```sql
INSERT INTO `showtimes`(`showtimes_id`, `film_id`, `room_id`, `movie_showtime`) VALUES
	(null,1,1,'2022-1-18 18:00:00'),
    (null,2,2,'2022-1-18 19:00:00'),
    (null,3,3,'2022-1-18 19:30:00'),
    (null,4,4,'2022-1-18 20:00:00')
```

bảng chỗ ngồi

```sql
INSERT INTO `seat`(`seat_id`, `room_id`, `column`, `row`, `status`) VALUES
	(null,1,1,'A','còn trống'),
    (null,1,2,'A','đã có người'),
    (null,1,3,'A','còn trống'),
    (null,2,1,'A','đã có người'),
    (null,2,2,'A','còn trống'),
    (null,2,3,'A','đã có người'),
    (null,3,1,'A','còn trống'),
    (null,3,2,'A','đã có người'),
    (null,3,3,'A','còn trống'),
    (null,4,1,'A','đã có người'),
    (null,4,2,'A','còn trống'),
    (null,4,3,'A','đã có người')
```

bảng khách hàng

```sql
INSERT INTO `customer`(`customer_id`, `name`, `address`, `mobile`, `email`, `customer_type`) VALUES
	(null,'customer a','Hà Nội','0987654321','ca.@gmail.com','hội viên'),
    (null,'customer b','Hà Nội','0987654322','cb.@gmail.com','vô danh'),
    (null,'customer c','Hà Nội','0987654323','cc.@gmail.com','vô danh'),
    (null,'customer d','Hà Nội','0987654324','cd.@gmail.com','hội viên'),
    (null,'customer e','Hà Nội','0987654325','ce.@gmail.com','vô danh'),
    (null,'customer f','Hà Nội','0987654326','cf.@gmail.com','vô danh'),
    (null,'customer g','Hà Nội','0987654327','cg.@gmail.com','vô danh'),
    (null,'customer h','Hà Nội','0987654328','ch.@gmail.com','vô danh'),
    (null,'customer i','Hà Nội','0987654329','ci.@gmail.com','hội viên'),
    (null,'customer j','Hà Nội','0987654330','cj.@gmail.com','vô danh')
```

bảng vé

```sql
INSERT INTO `ticket`(`ticket_id`, `film_id`, `customer_id`, `ticket_type_id`, `shelf_life`, `personnel_id`, `seat_id`) VALUES
	(null,1,1,2,'2020-1-18',1,2),
    (null,1,null,1,'2020-1-18',1,1),
    (null,1,null,1,'2020-1-18',1,6),
    (null,2,null,1,'2020-1-18',1,3),
    (null,2,null,1,'2020-1-18',1,5),
    (null,2,4,2,'2020-1-18',1,4),
    (null,3,null,1,'2020-1-18',1,7),
    (null,3,null,1,'2020-1-18',1,8),
    (null,3,null,1,'2020-1-18',1,9),
    (null,4,null,1,'2020-1-18',1,10),
    (null,4,9,2,'2020-1-18',1,12),
    (null,4,null,1,'2020-1-18',1,11)
```

bảng lương

```sql
INSERT INTO `payroll`(`payroll_id`, `personnel_id`, `shift_id`, `month`) VALUES
	(null,1,4,1),
    (null,2,2,1),
    (null,3,4,1),
    (null,4,4,1),
    (null,5,4,1),
    (null,6,4,1),
    (null,7,3,1),
    (null,8,4,1)
```

bảng lương - thưởng

```sql
INSERT INTO `payroll_bonus`(`payroll_bonus_id`, `payroll_id`, `bonus_id`, `bonus_date`) VALUES
	(null,1,1,'2022-1-18'),
    (null,2,1,'2022-1-18'),
    (null,3,1,'2022-1-18'),
    (null,4,1,'2022-1-18'),
    (null,5,1,'2022-1-18'),
    (null,6,1,'2022-1-18'),
    (null,7,1,'2022-1-18'),
    (null,8,1,'2022-1-18')
```

bảng lương - phạt

```sql
INSERT INTO `payroll_punish`(`payroll_punish_id`, `payroll_id`, `punish_id`, `punish_date`) VALUES
	(null,1,1,'2022-1-11'),
    (null,2,1,'2022-1-15'),
    (null,3,2,'2022-1-21')
```

bảng nhà cung cấp

```sql
INSERT INTO `supplier`(`supplier_id`, `name`, `address`, `mobile`, `email`) VALUES
	(null,'supplier a','Hà Nội','0123654789','sa@gmail.com'),
    (null,'supplier b','Hà Nội','0123654788','sb@gmail.com'),
    (null,'supplier c','Hà Nội','0123654787','sc@gmail.com'),
    (null,'supplier d','Hà Nội','0123654786','sd@gmail.com')
```

bảng phiếu nhập

```sql
INSERT INTO `phieunhap`(`phieunhap_id`, `personnel_id`, `supplier_id`, `ngay_nhap`) VALUES
	(null,3,1,'2021-12-28'),
    (null,4,2,'2021-1-5'),
    (null,3,3,'2021-1-7'),
    (null,4,4,'2021-1-10')
```

bảng nguyên liệu

```sql
INSERT INTO `ingredient`(`ingredient_id`, `name`, `dvtinh`, `expired_date`) VALUES
	(null,'Coca','L','2020-12-30'),
    (null,'Pessi','L','2020-12-30'),
    (null,'Panta','L','2020-12-30'),
    (null,'7Up','L','2020-12-30'),
    (null,'Bỏng ngô','Kg','2020-12-30'),
    (null,'Ống hút','Cái',null),
    (null,'Cốc','Cái',null),
    (null,'Xoài','Kg','2020-2-1')
```

bảng chi tiết phiếu nhập

```sql
INSERT INTO `ctphieunhap`(`ctphieunhap`, `phieunhap_id`, `ingredient_id`, `amount`, `price`) VALUES
	(null,1,1,10,10000),
    (null,1,2,10,10000),
    (null,1,3,10,10000),
    (null,1,4,10,10000),
    (null,2,6,1000,100),
    (null,2,7,1000,100)
```

bảng sản phẩm

```sql
INSERT INTO `items`(`items_id`, `name`, `size`, `price`) VALUES
	(null,'Coca','L',15000),
    (null,'Coca','XL',20000),
    (null,'7Up','L',15000),
    (null,'7Up','XL',20000),
    (null,'Panta','L',15000),
    (null,'Panta','XL',20000),
    (null,'Bỏng ngô','L',15000),
    (null,'Bỏng ngô','XL',20000)
```

bảng sản phẩm - nguyên liệu

```sql
INSERT INTO `items_ingredient`(`items_id`, `ingredient_id`) VALUES
    (1,6),
    (1,7),
    (3,6),
    (3,7),
    (5,6),
    (5,7),
    (7,5),
    (7,7)
```

bảng hóa đơn

```sql
INSERT INTO `hoadon`(`hoadon_id`, `customer_id`, `personnel_id`) VALUES
    (null,1,3),
    (null,2,4),
    (null,3,3),
    (null,4,4),
    (null,5,3),
    (null,6,4)
```

bảng chi tiết hóa đơn

```sql
INSERT INTO `cthoadon`(`cthoadon_id`, `hoadon_id`, `items_id`, `amount`, `price`) VALUES
	(null,1,1,1,15000),
    (null,1,7,1,15000),
    (null,2,2,1,20000),
    (null,2,8,1,20000),
    (null,3,3,1,15000),
    (null,3,7,1,15000),
    (null,4,4,1,20000),
    (null,4,8,1,20000),
    (null,5,4,1,15000),
    (null,5,7,1,15000),
    (null,6,6,1,20000),
    (null,6,8,1,20000)
```
