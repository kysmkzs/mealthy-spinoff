class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    # ユーザにfavoを設定する
    # params[:type]の値にFavoボタンが押された時には「Favo」
    if params[:type] == "Favo"
      current_user.favo(@menu)
    end
  end

  def destroy
    @menu = Menu.find(params[:menu_id])

    # 紐付けの解除。 
    # params[:type]の値ににFavoedボタンが押された時には「Favo」
    if params[:type] == "Favo"
      current_user.unfavo(@menu)
    end
  end
end
