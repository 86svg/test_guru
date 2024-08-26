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
max = User.find_or_create_by!(email: 'max@mail.ru') do |user|
  user.first_name = 'Max'
  user.last_name = 'Max'
  user.password = '111111'
  user.password_confirmation = '111111'
  user.type = 'Admin'
  user.confirmed_at = Time.now
end

kate = User.find_or_create_by!(email: 'kate@mail.ru') do |user|
  user.first_name = 'Kate'
  user.last_name = 'Kate'
  user.password = '123456'
  user.password_confirmation = '123456'
  user.confirmed_at = Time.now
end

viky = User.find_or_create_by!(email: 'viky@mail.ru') do |user|
  user.first_name = 'Viky'
  user.last_name = 'Viky'
  user.password = '111111'
  user.password_confirmation = '111111'
  user.confirmed_at = Time.now
end

# Категории
history = Category.find_or_create_by!(title: 'history')
geography = Category.find_or_create_by!(title: 'geography')

# Тесты
test_history_dates = Test.find_or_create_by!(title: 'даты', level: 1, author: max, category: history)
test_history_presidents = Test.find_or_create_by!(title: 'президенты', level: 3, author: max, category: history)
test_geography_rivers = Test.find_or_create_by!(title: 'реки', level: 2, author: kate, category: geography)
test_geography_mountains = Test.find_or_create_by!(title: 'горы', level: 1, author: viky, category: geography)

# Вопросы и ответы
history_question1 = test_history_dates.questions.find_or_create_by!(body: 'Когда началась Вторая мировая война?')
history_question2 = test_history_presidents.questions.find_or_create_by!(body: 'Кто был первым президентом США?')

geography_question1 = test_geography_rivers.questions.find_or_create_by!(body: 'Какая самая длинная река в мире?')
geography_question2 = test_geography_mountains.questions.find_or_create_by!(body: 'В какой стране находится гора Эверест?')

history_question1.answers.find_or_create_by!(body: '1939', correct: true)
history_question1.answers.find_or_create_by!(body: '1941', correct: false)
history_question1.answers.find_or_create_by!(body: '1914', correct: false)
history_question1.answers.find_or_create_by!(body: '1936', correct: false)

history_question2.answers.find_or_create_by!(body: 'Джордж Вашингтон', correct: true)
history_question2.answers.find_or_create_by!(body: 'Авраам Линкольн', correct: false)
history_question2.answers.find_or_create_by!(body: 'Томас Джефферсон', correct: false)
history_question2.answers.find_or_create_by!(body: 'Джон Адамс', correct: false)

geography_question1.answers.find_or_create_by!(body: 'Амазонка', correct: true)
geography_question1.answers.find_or_create_by!(body: 'Нил', correct: false)
geography_question1.answers.find_or_create_by!(body: 'Янцзы', correct: false)
geography_question1.answers.find_or_create_by!(body: 'Миссисипи', correct: false)

geography_question2.answers.find_or_create_by!(body: 'Непал', correct: true)
geography_question2.answers.find_or_create_by!(body: 'Индия', correct: false)
geography_question2.answers.find_or_create_by!(body: 'Китай', correct: false)
geography_question2.answers.find_or_create_by!(body: 'Пакистан', correct: false)

# Добавляем прохождения тестов пользователями
max.test_passings.find_or_create_by!(status: 'пройден', test: test_history_dates)
max.test_passings.find_or_create_by!(status: 'в процессе', test: test_geography_rivers)

kate.test_passings.find_or_create_by!(status: 'в процессе', test: test_geography_rivers)
kate.test_passings.find_or_create_by!(status: 'в процессе', test: test_history_dates)

viky.test_passings.find_or_create_by!(status: 'в процессе', test: test_history_presidents)
viky.test_passings.find_or_create_by!(status: 'пройден', test: test_geography_mountains)
