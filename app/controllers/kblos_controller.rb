# the controller of blogs
class KblosController < ApplicationController
  before_action :set_kblo,only:[:show,:edit,:update,:destroy]
  before_action :security,only:[:show,:edit,:new,:destroy]

  def index
    @kblos=Kblo.all
  end

  def create
    # 以下のbuildは
    # @blog = Blog.new(blog_params)のあと
    # @blog.user_id = current_user.idをすることと同じ
    @kblo = current_user.kblos.build(kblo_params)
    if @kblo.save
      CreateMailer.create_blog_mail(@kblo).deliver
      redirect_to kblos_path,notice:"つぶやきました！"
    else
      render 'new'
    end
  end

  def new
    if params[:back]
      @kblo=Kblo.new(kblo_params)
    else
      @kblo=Kblo.new
    end
  end

  def confirm
    @kblo = current_user.kblos.build(kblo_params)
    render :new if @kblo.invalid?
  end

  def edit
  end

  def show
    @favorite = current_user.favorites.find_by(kblo_id: @kblo.id)
  end

  def update
    if @kblo.update(kblo_params)
      redirect_to kblos_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @kblo.destroy
    redirect_to kblos_path,notice:"つぶやきを削除しました！"
  end

  private

  def kblo_params
    params.require(:kblo).permit(:content)
  end

  def set_kblo
    @kblo=Kblo.find(params[:id])
  end


end
