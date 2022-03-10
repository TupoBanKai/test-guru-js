class FeedbacksMailer < ApplicationMailer

  def created_feedback(feedback)
    @feedback = feedback

    mail to: User.find_by(type: "Admin").email
  end
end
