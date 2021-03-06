class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.created_feedback(@feedback).deliver_now
      redirect_to tests_path
    else
      render :new
    end
  end

  private

   def feedback_params
    params.require(:feedback).permit(:body, :user_id)
  end
end
