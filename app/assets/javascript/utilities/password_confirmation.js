document.addEventListener('turbolinks:load', function() {
 var password  = document.getElementById('user_password')
 var password_confirmation = document.getElementById('user_password_confirmation')

 if (password && password_confirmation) {
  password.addEventListener('input', comparePwd)
  password_confirmation.addEventListener('input', comparePwd)
 }
})
function comparePwd(){
  var password  = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')
  if (password_confirmation.value.length == 0) {
    password_confirmation.style.borderColor = '-internal-light-dark'
    return
  }

  if (password_confirmation.value != password.value) {
    password_confirmation.style.borderColor = '#FF0000'
  } else {
    password_confirmation.style.borderColor = '#00FF00'
  }
}
