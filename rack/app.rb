require_relative "date"
class App
  CONTENT_TYPE = {"Content-Type" => "text/plain"}

  def call(env)
    req = Rack::Request.new(env)
    response("Not found", 404, CONTENT_TYPE) if !(link_check(req))

    date.date_format_check(env["QUERY_STRING"].split("."))

    response("Unknown time format #{date.errors} ", 400, CONTENT_TYPE) if date.success?

    response("#{DateTime.now.strftime(date.date_for_user)}", 200, CONTENT_TYPE)
  end

  def date
    @date ||= DateDefine.new()
  end

  def link_check(req)
    req.path == "/date"
  end

  def response(body, status, headers)
    response = Rack::Response.new(body, status, headers)
    response.finish
  end
end
