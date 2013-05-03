class CertificatesController < ApplicationController
load_and_authorize_resource
	def show
		@user = User.find params[:user_id]
		@certificate = Certificate.find params[:id]
	end

	def new
		@user = User.find(params[:user_id])
		@certificates = Certificate.new
		flash[:notice] = @user.id
	end

	def create
		@user = User.find(params[:user_id])
		@certificate = @user.certificates.build(params[:certificate])
		if @certificate.save
    	flash[:notice] = "#Certificate was successfully created."
    	redirect_to user_path(@user)
		else
			render :action => 'new'
		end
	end

	def edit
		@user = User.find params[:user_id]
		@certificate = Certificate.find params[:id]
	end

	def update
		@user = User.find params[:user_id]
		@certificate = Certificate.find params[:id]
		@certificate.update_attributes!(params[:certificate])
		flash[:notice] = "Certificate was successfully updated."
		redirect_to user_path(@user)
	end

	def destroy

	end

end
