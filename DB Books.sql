CREATE DATABASE Books;
use Books;
CREATE TABLE book (bookId int PRIMARY KEY AUTO_INCREMENT, bookCategory varchar(30), bookName varchar(30));
INSERT INTO book (bookCategory, bookName) VALUES ("Спорт", "Дело в теле"), ("Спорт", "Йога"), ("Тестирование", "Тестирование Дот Ком"), ("Тестирование", "Как тестируют в Google"), ("Детские", "Гарри Поттер"), ("Детские", "Приключения Тома Сойера"), ("Бизнес", "Думай медленно, решай быстро"), ("Бизнес", "Богатый Папа, Бедный Папа"), ("Приключения", "Робинзон Крузо"), ("Приключения", "Приключения Шерлока Холмса");
ALTER TABLE book ADD COLUMN publisherCountry varchar(30) NOT NULL; 
UPDATE book SET publisherCountry = "N/A";
UPDATE book SET publisherCountry = "Украина" where bookName = "Йога";
UPDATE book SET publisherCountry = "Украина" where bookName = "Приключения Тома Сойера"; 
UPDATE book SET publisherCountry = "Украина" where bookName = "Как тестируют в Google"; 
UPDATE book SET publisherCountry = "Украина" where bookName = "Думай медленно, решай быстро";
UPDATE book SET publisherCountry = "Польша" where bookName = "Дело в теле";
UPDATE book SET publisherCountry = "Польша" where bookName = "Тестирование Дот Ком";
UPDATE book SET publisherCountry = "Польша" where bookName = "Богатый Папа, Бедный Папа";
UPDATE book SET publisherCountry = "США" where bookName = "Гарри Поттер";
UPDATE book SET publisherCountry = "США" where bookName = "Робинзон Крузо";
UPDATE book SET publisherCountry = "США" where bookName = "Приключения Шерлока Холмса";
select * from book;
select bookCategory from book where bookCategory like "%п%";
SELECT DISTINCT bookCategory from book;
select count(distinct bookCategory) from book;  
select count(distinct bookCategory) from book where publisherCountry = "США";
select count(distinct bookCategory) from book where publisherCountry = "Украина";
select count(distinct bookCategory) from book where publisherCountry = "Польша";
SELECT publisherCountry, count(distinct bookCategory) FROM book GROUP BY publisherCountry;
CREATE TABLE price (priceId int PRIMARY KEY AUTO_INCREMENT, bookPrice decimal, bookId int, foreign key (bookId) references book (bookId));
INSERT INTO price (bookPrice, bookId) VALUES ("100", "5"), ("200", "8"), ("520", "6"), ("350", "1"), ("1000", "2"), ("570", "3"), ("750", "10"), ("800", "4"), ("630", "7"), ("910", "9");
select * from book, price where book.bookId = price.bookId;
select * from price;
select bookPrice, bookId from price where bookPrice = (select min(bookPrice) from price);
select bookPrice from price where bookPrice >= 500 and bookPrice <= 1000;
delete from price where bookPrice < 500; 
-- DROP DATABASE books;