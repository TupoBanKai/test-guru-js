class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show

  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call
    if service.success?
      Gist.create(email_user: @test_passage.user, qeustion: @test_passage.current_quesiton, gist_remote_id: result.id )
      flash[:notice] = t('.success') + result.rels[:repos].href
    else
      flash[:alert] = t.('failure')
    end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
