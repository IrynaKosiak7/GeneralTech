//В рамках БД social_network напишите следующие запросы:
//Вывести среднюю реакцию по всем публикациям
db.post_reactions.aggregate([
    {
        $group: {
            _id: '$post_id',
            avg_value: { $avg: '$value' }
        }
    }
])

//Вывести среднюю реакцию авторов из USA
db.post_reactions.aggregate([
    {
        $lookup: {
            from: 'users',
            localField: 'author_id',
            foreignField: '_id',
            as: 'author'
        }
    }, {
        $match: { country: 'France' }
    }, {
        $group: {
            _id: '$post_id',
            avg_reaction: { $avg: '$value' }
        }
    }
])

//Увеличить баланс всех не заблокированных юзеров на 0.5%
db.users.updateMany(
    { is_blocked: { $ne: true } },
    { $mul: { balance: 1.005 } }
)

//Вывести ко-во реакций с оценкой 4
db.post_reactions.countDocuments({
     value: 4
})

OR

db.post_reactions.aggregate([
    {
        $match: { value: 4 }
    },
    { $count: 'total' }
])
