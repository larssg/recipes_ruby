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
    @recipe = Recipe.new(params[:recipe])
    @recipe.user = current_user
    @recipe.save ? redirect_to(recipes_url) : render(:action => 'new')
  end
end
