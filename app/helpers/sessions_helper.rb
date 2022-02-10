module SessionsHelper

  def flash_helper
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    end
  end

end
