
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
(1, '+380675497384', 'Ivan'),
(2, '+380507892483', 'Olga'),
(3, '+7311958955485', 'David'),
(4, '+0157234925657', 'Mike'),
(5, '+421955856552', 'Lisa'),
(6, '+3104578624855', 'Ken'),
(7, '+4978249617753', 'Barbie')

--3. Вывести сумму всех транзакций отдельно по каждой валюте (в упорядоченном виде)
select
accounts.currency,
sum(txs.amount) as sum_amount_by_currency
FROM txs
JOIN accounts on txs.sender_account_id = accounts.id
GROUP by accounts.currency
order by sum_amount_by_currency asc
