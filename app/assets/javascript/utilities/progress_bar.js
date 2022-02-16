document.addEventListener('turbolinks:load', function() {
  var el = document.querySelector('.progress-bar')

  if (el) {
    var count = el.dataset.count
    var current = el.dataset.current
    el.style.width = current / count * 100 + "%"
  }
})
