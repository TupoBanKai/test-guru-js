require_relative "date"
class App
  def call(env)
    req = Rack::Request.new(env)

    response("Not found", 404, {"Content-Type" => "text/plain"}) unless link_check(req)

    result = DateDefine.new(env["QUERY_STRING"].split("."))

    response("Unknown time format #{result.errors} ", 400, {"Content-Type" => "text/plain"}) unless result.errors[0].nil?

    response("#{DateTime.now.strftime(result.date_for_user)}", 200, {"Content-Type" => "text/plain"})
  end

  def link_check(req)
    req.path == "/date"
  end

  def response(body, status, headers)
    return Rack::Response.new(body, status, headers)
  end
end
