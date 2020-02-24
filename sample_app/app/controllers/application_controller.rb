class ApplicationController < ActionController::Base

  def cover_page
    render "coverpage/cover"
  end
end
