//Добавить тег test для тех видео, у которых его нет
db.videos.updateMany(
    { tags: { $ne: 'test' } },
    {
        $push: { tags: 'test' }
    }
)


//Вывести названия роликов с тегом test
db.videos.find(
    { tags:  'test' },
    {title: 1, _id:0}
)


