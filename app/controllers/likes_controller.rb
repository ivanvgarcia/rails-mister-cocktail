class LikesController < ApplicationController
  before_action :set_cocktail
  def create
    @like = Like.new
    @like.like = true
    @like.cocktail = @cocktail
    @like.save
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
