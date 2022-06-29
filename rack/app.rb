require_relative "date"
class App
  CONTENT_TYPE = {"Content-Type" => "text/plain"}

  def call(env)
    date = DateService.new()
    req = Rack::Request.new(env)
    if link_check(req)
      if date.success?
        date.date_format_check(env["QUERY_STRING"].split("."))
        response("#{DateTime.now.strftime(date.date_for_user)}", 200, CONTENT_TYPE)
      else
        response("Unknown time format #{date.errors} ", 400, CONTENT_TYPE)
      end
    else
      response("Not found", 404, CONTENT_TYPE)
    end
  end

  def link_check(req)
    req.path == "/date"
  end

  def response(body, status, headers)
    response = Rack::Response.new(body, status, headers)
    response.finish
  end
end
