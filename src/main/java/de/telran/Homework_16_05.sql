
--1. Создать таблицу друзей с использованием механизма валидации данных в SQL
create Table friends(
 id int primary key auto_increment,
  user_id int  not null,
  phone_number varchar(13)  not null,
  name varchar(150)  not null,
  created_at timestamp not NULL default current_timestamp,
  is_blocked bool default false,

 	foreign key(user_id) references users(id)
  );


--2. Добавить в таблицу друзей несколько записей
INSERT INTO friends(user_id, phone_number, name)
VALUES
(1, '+3806754973', 'Ivan'),
(2, '+3805078924', 'Petr'),
(3, '+73119589554', 'Iryna'),
(4, '+01572349256', 'Divan'),
(5, '+4219558565', 'Michael')

--3. Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)
SELECT currency,
sum(amount) as total_sum
FROM transact
join accounts on transact.sender_account_id = accounts.id
group by currency
order by total_sum ASC
