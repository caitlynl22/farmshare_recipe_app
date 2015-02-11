require 'byebug'
class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments
  end
end
