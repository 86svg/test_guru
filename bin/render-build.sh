#1/bin/bash
# Установка необходимых плагинов Babel
yarn add @babel/plugin-transform-private-methods @babel/plugin-transform-private-property-in-object
# Установка зависимостей с использованием frozen lockfile
yarn install
# Очистка старых ассетов
bundle exec rails assets:clobber
# Установка Ruby зависимостей
bundle install
# Компиляция ассетов Webpacker
bundle exec rails webpacker:compile
# Компиляция ассетов
bundle exec rake assets:precompile
# Очистка старых ассетов
bundle exec rake assets:clean
# Применение миграций базы данных
bundle exec rails db:migrate
# Очистка кэша Yarn
yarn cache clean