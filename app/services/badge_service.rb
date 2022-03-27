class BadgeService
  TERMS = [:condition_on_points]

  def initialize(result, current_user)
    @result = result
    @current_user = current_user
  end

  def cop_required_badges
    @badges = Badge.where('value <= ?', @result)
  end

  def badge_push
    for i in cop_required_badges
      @current_user.badges.push(i)
    end
  end
end
