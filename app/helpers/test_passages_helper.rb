module TestPassagesHelper
  def set_style
    if @test_passage.success?
      "<p style='color:green'> #{@test_passage.count_true_answers} </p><p>You passed the test</p>"
    else
      "<p style='color:red'> #{@test_passage.count_true_answers} </p><p>You did not passed the test</p>"
    end
  end

end
