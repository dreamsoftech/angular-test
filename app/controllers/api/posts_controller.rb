class Api::PostsController < ApplicationController

  # GET /api/posts
  # GET /api/posts.json
	def index
		@posts = Post.all

		render json: @posts
	end

  # DELETE /api/posts/1
  # DELETE /api/posts/1.json
	def destroy
    service.destroy
    render json: service, status: 200
  end

  def update
    service.update_attributes(safe_params)

    render json: service, status: 204
  end

  private

  def service
    @service ||= Post.find(params[:id])
  end

  def safe_params
    params.require(:post).permit(:name, :description, :active, :category)
  end
end