class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show

  end

  def result
  end

  def update
    if @test_passage.completed?
      @test_passage.accept!(params[:answer_ids])
      # TestsMailer.completed_test(@test_passage).deliver_now
      badge_service = BadgeService.new(@test_passage.count_true_answers, current_user)
      badge_service.badge_push
      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.accept!(params[:answer_ids])
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call
    if service.success?
      Gist.create(user_id: @test_passage.user.id, question_id: @test_passage.current_question.id, gist_remote_id: result.id )
      flash[:notice] = t('.success') + ' ' + result.html_url
    else
      flash[:alert] = t.('failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
