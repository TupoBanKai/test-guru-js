class FeedbacksController < ApplicationController
  # before_action :feedback_params, only: []

  def new
    @feedback = Feedback.new
  end
  def create
    new_feedback = current_user.feedbacks.new(feedback_params)

    if new_feedback.save
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
