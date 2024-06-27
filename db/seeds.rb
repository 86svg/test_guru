# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Пользователи
max, kate, viky =
  User.create!([
                 { name: 'Max', email: 'max@mail.ru' },
                 { name: 'Kate', email: 'kate@mail.ru' },
                 { name: 'Viky', email: 'viky@mail.ru' }
               ])

# Категории
history, geography =
  Category.create!([
                     { title: 'history' },
                     { title: 'geography' }
                   ])

# Тесты
test_history, test_geography =
  Test.create!([
                 { title: 'даты', level: 1, author: max, category: history },
                 { title: 'президенты', level: 3, author: max, category: history  },
                 { title: 'реки', level: 2, author: kate, category: geography },
                 { title: 'горы', level: 1, author: viky, category: geography }
               ])

# Вопросы и ответы можно добавить аналогично, если они необходимы
# Пример добавления вопросов:
history_question1, history_question2 =
         test_history.questions.create!([
                                          { body: 'Когда началась Вторая мировая война?' },
                                          { body: 'Кто был первым президентом США?' }
                                        ])
geography_question1, geography_question2 =
        test_geography.questions.create!([
                                            { body: 'Какая самая длинная река в мире?' },
                                            { body: 'В какой стране находится гора Эверест?' }
                                          ])

# Пример добавления ответов:
history_question1.answers.create!([
                                    { body: '1939', correct: true },
                                    { body: '1941', correct: false },
                                    { body: '1914', correct: false },
                                    { body: '1936', correct: false }
                                  ])

history_question2.answers.create!([
                                    { body: 'Джордж Вашингтон', correct: true },
                                    { body: 'Авраам Линкольн', correct: false },
                                    { body: 'Томас Джефферсон', correct: false },
                                    { body: 'Джон Адамс', correct: false }
                                  ])

geography_question1.answers.create!([
                                      { body: 'Амазонка', correct: true },
                                      { body: 'Нил', correct: false },
                                      { body: 'Янцзы', correct: false },
                                      { body: 'Миссисипи', correct: false }
                                    ])

                                    geography_question2.answers.create!([
                                      { body: 'Непал', correct: true },
                                      { body: 'Индия', correct: false },
                                      { body: 'Китай', correct: false },
                                      { body: 'Пакистан', correct: false }
                                    ])

# Добавляем прохождения тестов пользователями
      max.test_passings.create!([
                            { status: 'пройден', test: test_history },
                            { status: 'в процессе', test: test_geography }
                          ])

       kate.test_passings.create!([
                             { status: 'в процессе', test: test_geography },
                             { status: 'в процессе', test: test_history }
                           ])

       viky.test_passings.create!([
                             { status: 'в процессе', test: test_history },
                             { status: 'пройден', test: test_geography }
                           ])
