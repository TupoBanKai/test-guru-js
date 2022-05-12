require_relative 'app'
require_relative 'middleware/date_middleware'

use DateMiddleware
run App.new
