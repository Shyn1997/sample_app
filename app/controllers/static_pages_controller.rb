class StaticPagesController < ApplicationController
  def contact; end

  def home
    return unless logged_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.microposts.sorted.page params[:page]
  end
end
