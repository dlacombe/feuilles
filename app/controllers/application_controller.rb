class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :link_return

  private

# handles storing return links in the session
  def link_return
    if params[:return_uri]
      session[:original_uri] = params[:return_uri]
    end
  end
end
