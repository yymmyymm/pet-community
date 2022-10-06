class Public::PostImagesController < ApplicationController


  def new
    @post_image = PostImage.new
    @tag = Tag.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.customer_id = current_customer.id
    tag_list=params[:post_image][:name].split(',')
    if @post_image.save
       @post_image.save_tag(tag_list)
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.page(params[:page])
    @tag_list=Tag.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    @post_tags = @post_image.tags
  end

  def edit
    @post_image = PostImage.find(params[:id])
    @tag_list=@post_image.tags.pluck(:name).join(',')
  end

  def update
    @post_image = PostImage.find(params[:id])
    tag_list=params[:post_image][:name].split(',')
    if @post_image.update(post_image_params)
       @old_relations=PostTag.where(post_image_id: @post_image.id)
       @old_relations.each do |relation|
         relation.delete
       end
         @post_image.save_tag(tag_list)
       redirect_to post_image_path(@post_image.id),notice:'投稿完了しました:)'
    else
      render:show
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  def search_post_image
     @post_image=PostImage.new
     @post_images = PostImage.search(params[:keyword]).page(params[:page])
  end

  def search_tag
    @tag_list=Tag.all
    @tag=Tag.find(params[:tag_id])
    @post_images=@tag.post_images.page(params[:page]).per(10)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :caption, :image, :category)
  end
end
