document.addEventListener('turbolinks:load', function() {
  var el = document.querySelector('.progress-bar')

  if (el) {
    var count = el.dataset.count
    var current = el.dataset.current
    el.style.width = current / count * 100 + "%"
    // console.log(current / count * 100 + "%")
  }
})

// function updateProgressBar() {
//   var width = current.to_f / count * 100
//   this.el.style.width = width + "%"
//   this.el.style.color = "#8B0000"
// }
