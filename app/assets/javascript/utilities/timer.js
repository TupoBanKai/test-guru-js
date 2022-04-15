document.addEventListener('turbolinks:load', function() {
 var i = document.getElementById('minute').innerHTML;
})
var floor = 0
function counter(){
  var i = document.getElementById('minute').innerHTML * 60;
  if (i <= 0) {
    clearTimeout(timer);
    document.forms[0].submit();
  } else {
    i = (i + floor) - 1;
    floor = i - Math.floor(i / 60) * 60
    document.getElementById('minute').innerHTML = Math.floor(i / 60)
    document.getElementById('second').innerHTML = i % 60
  }
}
var timer = setInterval(counter, 1000);
