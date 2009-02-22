class RecipesController < ApplicationController
  before_filter :authenticate
  
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(params[:recipe])
    if @recipe.save
      redirect_to edit_recipe_url(@recipe)
    else
      render :action => 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to edit_recipe_url(@recipe)
    else
      render(:action => 'edit')
    end
  end
end
