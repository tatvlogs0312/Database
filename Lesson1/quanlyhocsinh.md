```sql
 CREATE DATABASE quanlyhocsinh
```

**_Tạo bảng teacher_**

```sql
CREATE TABLE teacher(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    adderss TEXT NOT NULL
)
```

**_Tạo bảng subject_**

```sql
CREATE TABLE subject(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
)
```

**_Tạo bảng class_**

```sql
CREATE TABLE class(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    id_teacher INT NOT NULL,
    CONSTRAINT pk_id_teacher FOREIGN KEY (id_teacher) REFERENCES teacher (id)
)
```

**_Tạo bảng student_**

```sql
CREATE TABLE student(
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NAME TEXT NOT NULL,
    birthday DATE NOT NULL,
    adderss TEXT NOT NULL,
    mobile VARCHAR(11) NOT NULL,
    email TEXT NOT NULL,
    id_class INT NOT NULL,
    CONSTRAINT pk_id_class FOREIGN KEY (id_class) REFERENCES class(id)
)
```

**_Tạo bảng point_**

```sql
CREATE TABLE point(
	id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_subject INT NOT NULL,
    id_student INT NOT NULL,
    point FLOAT NOT NULL,
    CONSTRAINT pk_id_subject FOREIGN KEY (id_subject) REFERENCES subject(id),
    CONSTRAINT pk_id_student FOREIGN KEY (id_student) REFERENCES student(id)
)
```

_Thêm dữ liệu bảng teacher_

```sql
INSERT INTO `teacher`(`id`, `name`, `email`, `mobile`, `adderss`) VALUES
	(null,"A",'a@gmail.com','0123456781','Hà Nội'),
    (null,"B",'b@gmail.com','0123456782','Hà Nội'),
    (null,"c",'c@gmail.com','0123456783','Hà Nội');
```

_Thêm dữ liệu bảng subject_

```sql
INSERT INTO `subject`(`id`, `name`) VALUES
	(null,'java core'),
    (null,'database');
```

_Thêm dữ liệu bảng class_

```sql
INSERT INTO `class`(`id`, `name`, `id_teacher`) VALUES
	(null,'java 06',1),
    (null,'java 07',2),
    (null,'java 08',3);
```

_Thêm dữ liệu bảng student_

```sql
INSERT INTO `student`(`id`, `NAME`, `birthday`, `adderss`, `mobile`, `email`, `id_class`) VALUES
	(null,'Trần Anh Tuấn','2002-12-03','Hà Nội','0384551953','tanhtuan093@gmail.com',2),
    (null,'Nguyễn văn A','2000-02-03','Hà Nội','0123456789','nva0302@gmail.com',1),
    (null,'Phạm Văn B','1998-01-13','Hà Nội','0123456788','tanhtuan093pnv1301',3);
```

_Thêm dữ liệu bảng point_

```sql
INSERT INTO `point`(`id`, `id_subject`, `id_student`, `point`) VALUES
	(null,1,1,10),
    (null,2,1,10),
    (null,1,2,9),
    (null,2,3,9);
```
