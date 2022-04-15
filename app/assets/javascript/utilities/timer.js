document.addEventListener('turbolinks:load', function() {
 var i  = document.getElementById('time')
function counter(){
  if (i <= 0) {
    clearTimeout(timer);
  } else {
    i -= 1;
    document.getElementById('time').innerHTML = i
  }
}
counter();
var timer = setInterval(r, 1000);
