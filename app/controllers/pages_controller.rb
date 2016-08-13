class PagesController < ApplicationController
  before_action :authenticate_user!
  after_action :save_visitor, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def visitors
    @visitors = Visitor.where(user_id: current_user.id)
  end

  private

  def save_visitor
    return if @user.id == current_user.id

    visitor = Visitor.find_or_initialize_by(visitor_id: current_user.id, user_id: @user.id, visited_at: Date.today)
    visitor.updated_at = Time.now
    visitor.save
  rescue => e
    logger.warn "Save visitor error: #{e}"
  end
end
