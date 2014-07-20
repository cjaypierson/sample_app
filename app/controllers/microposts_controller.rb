class MicropostsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy


	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost create!"
			redirect_to root_url
		else
			@feed_items = current_user.feed.paginate(page: params[:page])
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to :back
	end

	private

		def micropost_params
			params.require(:micropost).permit(:content)
		end
end

