require_relative "date"
class App
  def call(env)
    req = Rack::Request.new(env)
    if link_check(req)
      date = DateService.new()
      response_qualifier(date)
    else
      response("Not found", 404)
    end
  end

  def link_check(req)
    req.path == "/date"
  end

  def response_qualifier(date)
    if date.success?
      date.date_format_check(env["QUERY_STRING"].split("."))
      response("#{DateTime.now.strftime(date.date_for_user)}", 200)
    else
      response("Unknown time format #{date.errors} ", 400)
    end
  end

  def response(body, status)
    response = Rack::Response.new(body, status, {"Content-Type" => "text/plain"})
    response.finish
  end
end
