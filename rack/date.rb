class DateDefine
  def initialize
    @date_format = {
      "year" => "%Y",
      "month" => "%m",
      "day" => "%d",
      "minute" => "%M",
      "second" => "%S"
    }
    @date_for_user = ''
    @errors = []
  end

  def errors
    @errors
  end

  def date_for_user
    @date_for_user
  end

  def success?
    if errors[0] == nil
      true
    end
    false
  end

  def date_format_check(params)
    params.each do |var|
      if @date_format[var]
        @date_for_user += "#{@date_format[var]}"
      else
        @errors.append(var)
      end
    end

  end
end
