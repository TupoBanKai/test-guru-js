class DateDefine
  def initialize(params)
    @date_format = {
      "year" => "%Y",
      "month" => "%m",
      "day" => "%d",
      "minute" => "%M",
      "second" => "%S"
    }
    @date_for_user = ''
    @errors = []
    date_format_check(params)
  end

  def errors
    @errors
  end

  def date_for_user
    @date_for_user
  end

  def date_format_check(params)
    params.each do |var|
      if @date_format.keys.include?(var)
        @date_for_user += "#{@date_format[var]}"
      else
        @errors.append(var)
      end
    end
  end
end
