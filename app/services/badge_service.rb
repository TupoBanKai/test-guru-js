class BadgeService

  def initialize(current_user, test_passage)
    @current_user = current_user
    @test_passage = test_passage
    @test_level = Test.find_by(id: @test_passage.test_id).level,
    @point_in_first_attempt = @test_passage.count_true_answers,
    @test_categories = Category.find_by(id: Test.find_by(id: @test_passage.test_id).category_id)
    @badges = []
  end

  def check_test_level
    @current_user.test_passages.join_tests(@test_level)
    @badges.append(badge_by_value(@test_level))
  end

  def check_point_in_first_attempt
    last_test_id = @current_user.test_passages.last.test_id
    count_attempts = TestPassage.where(test_id: last_test_id).count

    if count_attempts == 1 && @point_in_first_attempt == 100
      @badges.append(badge_by_value(100))
    end
  end

  def check_test_categories
    @current_user.test_passages.join_tests(@test_categories)
    @badges.append(badge_by_value(0))
  end

  def badge_push
    check_test_level
    check_point_in_first_attempt
    check_test_categories

    for i in @badges
      @current_user.badges.push(i)
    end
  end

  def badge_by_value(value)
    Badge.find_by(value: value)
  end

end
