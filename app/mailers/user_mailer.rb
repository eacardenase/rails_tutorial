class UserMailer < ApplicationMailer
  def confirm_account
    @user = params[:user]
    @url = "#{params[:url]}/confirm_email/#{@user.token}"

    mail(to: @user.email, subject: "Welcome to My Awesome Site")
  end
end
