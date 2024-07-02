// В рамках БД social_network выведите данные о трех произвольных реакциях на публикации
// (проекция: оценка, имя_автора_реакции, заголовок_публикации)
db.posts_reactions.aggregate([
    { $sample: { size: 3 } },
    {
        $lookup: {
            from: 'users',
            localField: 'author_id',
            foreignField: '_id',
            as: 'author'
        }
    },
    { $unwind: '$author' },
    {
        $lookup: {
            from: 'posts',
            localField: 'post_id',
            foreignField: '_id',
            as: 'post'
        }
    },
    { $unwind: '$post' },
    { $project: { value: 1, author_fullname: '$author.fullname', _id: 0, post_title: '$post.title' } }
])


