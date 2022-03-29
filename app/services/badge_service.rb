class BadgeService
  TERMS = ['check_test_level', 'check_point_in_first_attempt', 'check_test_categories']

  def initialize(current_user, test_passage)
    @current_user = current_user
    @test_passage = test_passage
    @badges = []
  end

  def check_test_level
    test_level = Test.find_by(id: @test_passage.test_id).level
    user_tests = @current_user.test_passages.join_tests(test_level).count
    tests = Test.where(level: test_level).count
    if user_tests == tests
      @badges.append(badge_by_rule('check_test_level'))
    end
  end

  def check_point_in_first_attempt
    count_attempts = TestPassage.where(test_id: @test_passage.test_id, user_id: @current_user.id).count
    if count_attempts == 1
      @badges.append(badge_by_rule('check_point_in_first_attempt'))
    end
  end

  def check_test_categories
    test_categories = Category.find_by(id: Test.find_by(id: @test_passage.test_id).category_id)
    @current_user.test_passages.join_tests(test_categories)
    @badges.append(badge_by_rule('check_test_categories'))
  end

  def badge_push
    collection = Badge.all
    for i in collection
      send("#{i.rule}")
    end

    for i in @badges
      @current_user.badges.push(i)
    end
  end

  def badge_by_rule(value)
    Badge.find_by(rule: value)
  end

end
