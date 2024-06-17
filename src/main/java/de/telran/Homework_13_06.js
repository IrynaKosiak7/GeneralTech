// Вывести названия двух произвольных треков с тегом mega
db.videos.aggregate([
    { $match: { tags: 'mega' } },
    { $sample: { size: 2 }},
    { $project: { title: 1, _id: 0 } }
])

// Вывести имя юзера с самым минимальным балансом
db.users.aggregate([
    { $sort: { balance: 1} },
    { $limit: 1 },
    { $project: { fullname: 1, _id: 0 } }
])

// Используя метод countDocuments(), вывести ко-во заблокированных юзеров с балансом от 10 до 1000 EUR (вкл.)
db.users.countDocuments(
    {
        is_blocked: true,
        balance: {
            $gte: 10,
            $lte: 1000
        }
    }

)

// Используя метод aggregate(), вывести ко-во незаблокированных юзеров не из Germany и не из France с балансом до 1000 EUR (не вкл.)
db.users.aggregate(
    {$match:{
         is_blocked:{$ne: true},
        country: {$nin: ['Germany', 'France']},
        balance: {$gt: 1000}}
    },{$count: 'total_is_not_blocked_users'}
)

// Также очень коротко опишите, как работает агрегация в MongoDB
Агрегация – это группировка значений многих документов.
Операции агрегирования позволяют манипулировать такими сгруппированными данными.
Это похоже на оператор "group by" в SQL.
В оболочке MongoDB статистический анализ реализован с помощью функции.
