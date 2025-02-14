document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title');

  if (control) {
    control.addEventListener('click', function() {
      console.log("Сортировка началась");
      sortRowsByTitle.call(this);
    });
  }
});

function sortRowsByTitle() {
  let table = document.querySelector('table');
  if (!table) return; // Проверка наличия таблицы
  let rows = Array.from(table.querySelectorAll('tr')).slice(1); // Пропускаем заголовок

  let isAscending = this.querySelector('.octicon-arrow-up').classList.contains('hide');

  rows.sort(isAscending ? compareRowsAsc : compareRowsDesc);

  // Перемещаем отсортированные строки обратно в таблицу
  rows.forEach(row => table.appendChild(row));

  // Переключаем иконки
  this.querySelector('.octicon-arrow-up').classList.toggle('hide', !isAscending);
  this.querySelector('.octicon-arrow-down').classList.toggle('hide', isAscending);
}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td') ? row1.querySelector('td').textContent : '';
  let testTitle2 = row2.querySelector('td') ? row2.querySelector('td').textContent : '';
  return testTitle1.localeCompare(testTitle2);
}

function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td') ? row1.querySelector('td').textContent : '';
  let testTitle2 = row2.querySelector('td') ? row2.querySelector('td').textContent : '';
  return testTitle2.localeCompare(testTitle1);
}
