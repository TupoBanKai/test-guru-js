class App
  def call(env)
    req = Rack::Request.new(env)
    if link_check(req)
      date_valid_check
    else
      [
        404,
        {"Content-Type" => "text/plain"},
        ["Not found"]
      ]
    end
  end

  def date_format_check(params)
    time = Time.new()
    @date = {valid: {}, invalid: {}}
    valid = @date[:valid]
    invalid = @date[:invalid]
    params.each do |var|
      case var
      when "year"
        valid.merge!({year: time.year})
      when "month"
        valid.merge!({month: time.month})
      when "day"
        valid.merge!({day: time.day})
      when "minute"
        valid.merge!({minute: time.min})
      when "second"
        valid.merge!({second: time.sec})
      else
        invalid.merge!({var => var})
      end
    end
  end

  def link_check(req)
    if req.path == "/date"
      date_format_check(req.query_string.split("%"))
    end
  end

  def date_valid_check
    if @date[:invalid].keys[0].nil?
    [
    200,
    {"Content-Type" => "text/plain"},
    ["#{@date[:valid]}"]
    ]
    else
    [
      400,
      {"Content-Type" => "text/plain"},
      ["Unknown time format #{@date[:invalid]} "]
    ]
    end
  end
end
