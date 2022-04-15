class BadgeService
  TERMS = ['check_test_level', 'check_point_in_first_attempt', 'check_test_categories']

  def initialize(current_user, test_passage)
    @current_user = current_user
    @test_passage = test_passage
  end

  def check_test_level(badge)
    test_level = @test_passage.test.level
    user_tests = @current_user.test_passages.tests_by_level(test_level).pluck(:test_id).uniq.count
    tests = Test.where(level: test_level).count
    user_tests == tests
  end

  def check_point_in_first_attempt(badge)
    count_attempts = TestPassage.where(test_id: @test_passage.test_id, user_id: @current_user.id).count

    count_attempts == 1 && TestPassages.success?
  end

  def check_test_categories(badge)
    test_categories = Test.category_collection(badge.value)
    user_categories = Test.join_test_passages(@test_passage.test.category_id, @current_user).uniq
    test_categories == user_categories
  end

  def badge_push
    Badge.all.each do |badge|
      @current_user.badges << badge if send("#{badge.rule}", badge)
    end
  end

end

