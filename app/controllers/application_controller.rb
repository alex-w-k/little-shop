class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart, :set_categories, :set_search
  helper_method :current_user, :current_admin?

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  def set_categories
    @categories = Category.all
  end

  def set_search
    @items_all = Item.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
