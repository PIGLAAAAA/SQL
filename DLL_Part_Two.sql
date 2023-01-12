/*
1. Создать таблицу exam с полями:
- идентификатора экзамена
- автоинкрементируемый, уникальный,
запрещает NULL;
- наименования экзамена- даты экзамена
*/

CREATE TABLE exam
(
exam_id serial UNIQUE NOT NULL,
exam_name varchar,
exam_date date 
);

/*2. Удалить ограничение
уникальности с поля идентификатора*/
ALTER TABLE exam
DROP CONSTRAINT exam_exam_id_key;
/*3 3. Добавить ограничение 
первичного ключа на поле 
идентификатора
*/
ALTER TABLE exam
ADD PRIMARY KEY (exam_id);
/*
4. Создать таблицу person с полями
- идентификатора личности (простой int,
первичный ключ)- имя- фамилия
5. Создать таблицу паспорта с полями:
- идентификатора паспорта
(простой int, первичный ключ)
- серийный номер (простой int, 
запрещает NULL)- регистрация- ссылка 
на идентификатор личности (внешний ключ)
*/
CREATE TABLE person
(
person_id integer  NOT NULL,
first_name varchar NOT NULL,
last_name varchar NOT NULL,
	
	CONSTRAINT pk_person_person_id PRIMARY KEY(person_id)
);

CREATE TABLE passport
(
passport_id int ,
serial_number int NOT NULL,
registration text NOT NULL,

person_id int NOT NULL,
CONSTRAINT pk_passport_passport_id PRIMARY KEY (passport_id),
CONSTRAINT fk_passport_person FOREIGN KEY (person_id) REFERENCES person (person_id) 
);
/*Добавить колонку веса в таблицу person
(создавали ранее) с ограничением
, проверяющим вес (больше 0 но меньше 100)*/
ALTER TABLE person
ADD COLUMN weigth decimal
CONSTRAINT CHK_person_weigth CHECK (weight > 0 AND weight < 100 );

/*
8. Создать таблицу student с полями:
- идентификатора (автоинкремент)-
полное имя- курс (по умолчанию 1)
9. Вставить запись в таблицу студентов
и убедиться, что ограничение на
вставку значения по умолчанию работает

10. Удалить ограничение
"по умолчанию" из таблицы студентов
*/



CREATE TABLE student
(
	student_id serial,
	full_name varchar,		
	grade int DEFAULT 1
);

INSERT INTO student
VALUES
(1, 'vasia');

SELECT *
FROM student;

ALTER TABLE student
ALTER COLUMN DROP DEFAULT;

