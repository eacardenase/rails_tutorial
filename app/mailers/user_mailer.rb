class UserMailer < ApplicationMailer
  def confirm_account
    @user = params[:user]
    @url = "http://127.0.0.1:3000/#{@user.token}"
    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end
end
