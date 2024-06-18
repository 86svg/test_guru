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
                     { title: 'История' },
                     { title: 'География' }
                   ])

# Тесты
test_history_level1, test_history_level3, test_geography_level2, test_geography_level1 =
  Test.create!([
                 { title: 'history', level: 1, category_id: history.id, author_id: max.id },
                 { title: 'history', level: 3, category_id: history.id, author_id: max.id },
                 { title: 'geography', level: 2, category_id: geography.id, author_id: kate.id },
                 { title: 'geography', level: 1, category_id: geography.id, author_id: viky.id }
               ])

# Вопросы и ответы можно добавить аналогично, если они необходимы
# Пример добавления вопросов:
                      Question.create!([
                                          { body: 'Когда началась Вторая мировая война?', test_id: history.id },
                                          { body: 'Кто был первым президентом США?', test_id: history.id }
                                        ])

                        Question.create!([
                                            { body: 'Какая самая длинная река в мире?', test_id: geography.id },
                                            { body: 'В какой стране находится гора Эверест?', test_id: geography.id }
                                          ])

# Пример добавления ответов:
                  Answer.create!([
                                    { body: '1939', correct: true, question_id: history.id },
                                    { body: '1941', correct: false, question_id: history.id },
                                    { body: '1914', correct: false, question_id: history.id },
                                    { body: '1936', correct: false, question_id: history.id }
                                  ])

                  Answer.create!([
                                    { body: 'Джордж Вашингтон', correct: true, question_id: history.id },
                                    { body: 'Авраам Линкольн', correct: false, question_id: history.id },
                                    { body: 'Томас Джефферсон', correct: false, question_id: history.id },
                                    { body: 'Джон Адамс', correct: false, question_id: history.id }
                                  ])

                    Answer.create!([
                                      { body: 'Амазонка', correct: true, question_id: geography.id },
                                      { body: 'Нил', correct: false, question_id: geography.id },
                                      { body: 'Янцзы', correct: false, question_id: geography.id },
                                      { body: 'Миссисипи', correct: false, question_id: geography.id }
                                    ])

                    Answer.create!([
                                      { body: 'Непал', correct: true, question_id: geography.id },
                                      { body: 'Индия', correct: false, question_id: geography.id },
                                      { body: 'Китай', correct: false, question_id: geography.id },
                                      { body: 'Пакистан', correct: false, question_id: geography.id }
                                    ])

# Добавляем прохождения тестов пользователями
      TestPassing.create!([
                            { status: 'пройден', test_id: test_history_level1.id, user_id: max.id },
                            { status: 'в процессе', test_id: test_geography_level2.id, user_id: max.id }
                          ])

       TestPassing.create!([
                             { status: 'в процессе', test_id: test_geography_level2.id, user_id: kate.id },
                             { status: 'в процессе', test_id: test_history_level3.id, user_id: kate.id }
                           ])

       TestPassing.create!([
                             { status: 'в процессе', test_id: test_history_level1.id, user_id: viky.id },
                             { status: 'пройден', test_id: test_geography_level1.id, user_id: viky.id }
                           ])
