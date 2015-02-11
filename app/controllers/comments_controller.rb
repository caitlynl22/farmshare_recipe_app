class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.new(comment_params)

    if @comment.save
      flash[:success] = 'Comment successfully created.'
      redirect_to recipe_path(@recipe)
    else
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @recipe = @comment.recipe
    @comment.destroy
    flash[:success] = 'Comment successfully deleted.'
    redirect_to ingredients_path
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :body)
    end
end
