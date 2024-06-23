class UserMailer < ApplicationMailer
  def confirm_account
    @user = 'Edwin Cardenas'
    mail(to: "eacardenase@unal.edu.co", subject: "Welcome to My Awesome Site")
  end
end
