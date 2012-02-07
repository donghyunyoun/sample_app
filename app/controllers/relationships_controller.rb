class RelationshipsController < ApplicationController
  before_filter :authenticate

  def create
    @user = User.find(params[:relaionship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html { redirect_to @user}
      format.js
    end
  end


  def destory
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user}
      format.js
    end
  end
end