document.addEventListener('turbolinks:load', function() {
  let password = document.querySelector('#user_password')
  let passwordConfirmation = document.querySelector('#user_password_confirmation');

  if (password && passwordConfirmation) {
    passwordConfirmation.addEventListener('input', iconDisplay)
    password.addEventListener('input', iconDisplay)
  }
})

function iconDisplay() {
  let passwordConfirmation = document.querySelector('#user_password_confirmation')

  if (passwordConfirmation.value != "" ) {
    stringComparison()
  } else {
    iconHide()
  }
}

function stringComparison(){
  let password = document.querySelector('#user_password')
  let passwordConfirmation = document.querySelector('#user_password_confirmation')
  if(password.value == passwordConfirmation.value){
    greenKey()
  } else {
    redKey()
  }
}

function iconHide(){
  let icon = document.querySelector('.octicon-key')
  icon.classList.add('hide')
}

function greenKey(){
  let icon = document.querySelector('.octicon-key')
  icon.classList.remove('hide')
  icon.classList.remove('text-danger')
  icon.classList.add('text-success')
}

function redKey() {
  let icon = document.querySelector('.octicon-key')
  icon.classList.remove('hide')
  icon.classList.remove('text-success')
  icon.classList.add('text-danger')
}