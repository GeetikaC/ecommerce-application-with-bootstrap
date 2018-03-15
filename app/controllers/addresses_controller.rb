class AddressesController < ApplicationController
	before_action :authenticate_user!
	def index 
		@addresses = current_user.addresses
	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(params[:address].permit(:name, :pincode, :street, :landmark, :city))
		@address.user_id = current_user.id
		if @address.save
			redirect_to addresses_path, notice: "Address successfully created"
		else
			render action: 'new'
		end
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update_attributes(params[:address].permit(:name, :pincode, :street, :landmark, :city))		
			redirect_to addresses_path, notice: "Address successfully updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to addresses_path, notice: "Address successfully deleted"
	end

end


