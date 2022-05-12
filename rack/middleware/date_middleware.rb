class DateMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    append_s = "#{DateTime.now}\n"
    [status, headers, body << append_s]
  end
end
