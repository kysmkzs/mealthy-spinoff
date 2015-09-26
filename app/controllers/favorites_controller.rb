class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @menu = Menu.find(params[:menu_id])

    # ユーザにlikeを設定する
    # params[:type]の値にLikeボタンが押された時には「Like」
    if params[:type] == "Like"
      @favorite = current_user.like @menu
    end
  end

  def destroy
    @menu = Menu.find(params[:menu_id])

    # 紐付けの解除。 
    # params[:type]の値ににUnlikedボタンが押された時には「Unlike」
    if params[:type] == "Unlike"
      current_user.unlike @menu
    end
  end
  
  private
  def like_params
    params.require(:menu).permit(:type)
  end
end