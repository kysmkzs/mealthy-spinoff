class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @menu = Menu.find(params[:menu_id])
    current_user.like(@menu)
  end

  def destroy
    @menu = current_user.liking_favorites.find(params[:id]).menu
    current_user.unlike(@menu)
  end
end