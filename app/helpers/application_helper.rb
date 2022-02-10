module ApplicationHelper
  def current_date
    Date.today.year
  end

  def current_link_to_project
    link_to('Учебный проект в онайн-школе Thinknetica', 'https://github.com/TupoBanKai/test-guru', target: true )
  end
end
