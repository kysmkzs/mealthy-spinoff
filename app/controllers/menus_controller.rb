class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:success] = "Welcome to the world of Mealthy!!!"
      redirect_to @menu
    else
      render 'new'
    end
  end
  
  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if @menu.update(user_params)
      redirect_to edit_menu_path , notice: 'メニューを更新しました'
    else
      render 'edit'
    end
  end
 

  private

  def menu_params
    params.require(:menu).permit(:name, :calorie, :image)
  end

end
