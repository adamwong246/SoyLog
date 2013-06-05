class ApplicationController < ActionController::Base
  protect_from_forgery
 
before_filter :signup_alert 
def signup_alert
  flash[:error] = "All users got erased. Whoops! ¯\\_(ツ)_/¯ You should signup again <a href=\"https://docs.google.com/forms/d/1PXb17xOqB8YawAb5v5tc00WtFM1qBSgcccMsZ2xahSU/viewform\"> here </a>"
end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end

  private

  # AngularJS automatically sends CSRF token as a header called X-XSRF
  # this makes sure rails gets it
  def verified_request?
    !protect_against_forgery? || request.get? ||
      form_authenticity_token == params[request_forgery_protection_token] ||
      form_authenticity_token == request.headers['X-XSRF-Token']
  end
 end

