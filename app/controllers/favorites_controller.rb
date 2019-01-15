class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(kblo_id: params[:blog_id])
    redirect_to kblos_url, notice: "#{favorite.kblo.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to kblos_url, notice: "#{favorite.kblo.user.name}さんのブログをお気に入り解除しました"
  end
end
