class BadgeService
  TERMS = ['check_test_level', 'check_point_in_first_attempt', 'check_test_categories']

  def initialize(current_user, test_passage)
    @current_user = current_user
    @test_passage = test_passage
    @badges = []
  end

  def check_test_level(badge)
    test_level = Test.find_by(id: @test_passage.test_id).level
    user_tests = @current_user.test_passages.tests_by_level(test_level).count
    tests = Test.where(level: test_level).count
    if user_tests == tests
      @badges.append(badge)
    end
  end

  def check_point_in_first_attempt(badge)
    count_attempts = TestPassage.where(test_id: @test_passage.test_id, user_id: @current_user.id).count
    if count_attempts == 1
      @badges.append(badge)
    end
  end

  def check_test_categories(badge)
    test_categories = Test.category_collection(badge.value)
    user_categories = Test.join_test_passages(@test_passage.test.category_id, @current_user).uniq
    if test_categories == user_categories
      @badges.append(badge)
    end
  end

  def badge_push
    collection = Badge.all
    collection.each do |badge|
      send("#{badge.rule}", badge)
    end

    @badges.each do |badge|
      @current_user.badges.push(badge)
    end
  end

end

