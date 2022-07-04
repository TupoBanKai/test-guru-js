class DateService
  DATE_FORMAT = {
      "year" => "%Y",
      "month" => "%m",
      "day" => "%d",
      "minute" => "%M",
      "second" => "%S"
    }

  def initialize
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
    errors.any?
  end

  def date_format_check(params)
    params.each do |var|
      if DATE_FORMAT[var]
        @date_for_user += "#{DATE_FORMAT[var]}"
      else
        @errors.append(var)
      end
    end

  end
end
