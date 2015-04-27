class DishesController < ApplicationController

  def index
    @dishes = Dish.all
  end

  def create
    @dish = Dish.create(dish_params)
    redirect_to '/dishes'
  end

  def new
    @dish = Dish.new
  end

  def dish_params
    params.require(:dish).permit(:name, :price)
  end

end
