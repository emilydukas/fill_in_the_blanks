class PostsController < ApplicationController
	# BONUS! Learn how to use a before_action to keep your controller DRY

	def index
		@posts = Post.all
		# create an instance variable that points to all of our posts
		# there are already some seeded posts, get them to show up in your app
	end

	def new
		@post = Post.new
		# instantiate an empty (new) Post
	end

	def create
		@post = Place.new(post_params)

		if @post.save
			redirect_to @post
		else
			render :new
		end
		# create a Post and save it into the database
		# redirect to the new Post
	end

	def show
		@post = Post.find params[:id]
		# assign an instance variable to the post with id from params
	end

	def edit
		@post = Post.find(params[:id])
		# assign an instance variable to the post with id from params
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to posts_path
		else
			render :edit			
		end
		# update the instance variable from our edit page
		# redirect to the updated post
	end

	def destroy
		@ost = Post.find(params[:id])

		if @post.destroy
		redirect_to posts_path
		end
		# assign an instance variable to the post with id from params
		# destroy the post
		# redirect to index
	end

private
	def post_params
		params.require(:post).permit(:title, :body, :bru_name)
		# fill in with strong parameters
	end
end
