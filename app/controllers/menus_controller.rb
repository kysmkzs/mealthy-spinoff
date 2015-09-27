class MenusController < ApplicationController
  def new
    @menu = Menu.new
  end

  def index
    @menus = Menu.all.order("updated_at DESC").limit(50)
  end

  def create  
    @menu = Menu.new(menu_params)
    if @menu.save
      flash[:success] = "Enjoy Healthy Meal !"
      redirect_to @menu
    else
      render 'new'
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @post = current_user.posts.build(@post_params)
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

  def lowcalorie
    @menus = Menu.order("calorie asc")
  end

  def lowcarb
    @menus = Menu.order("carb asc")
  end

  def glutenfree
    @glutenfrees = Menu.where(gluten: '0').all
  end

  def vege
    @veges = Menu.where(vege: '0').all
  end

  def like
    @like = Favorite.where(like: 'like').all
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :calorie, :image, :protein, :lipid, :carb, :sodium, :price, :gluten, :vege, :type)
  end
end