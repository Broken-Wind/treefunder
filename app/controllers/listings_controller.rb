class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end
	def show
		@listing = Listing.find(params[:id])
	end
	def new
		@listing = Listing.new
	end
  	def create
		uploaded_file = params[:listing][:image]
		File.open(Rails.root.join('public', 'images', uploaded_file.original_filename), 'wb') do |file|
		  file.write(uploaded_file.read)
		end
		@listing = Listing.new(listing_params)
		@listing[:image] = 'public/images/' + uploaded_file.original_filename
		if @listing.save
			redirect_to @listing
		else
			render :new
		end
	end
	def edit
		@listing = Listing.find(params[:id])
	end
	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listing_params)
			redirect_to @listing
		else
			render :edit
		end
	end
	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy

		redirect_to root_path
	end
	private
		def listing_params
			params.require(:listing).permit(:title, :tagline, :description, :image, :investment_goal, :valuation)
		end
end
