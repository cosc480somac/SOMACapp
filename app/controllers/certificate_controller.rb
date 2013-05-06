class CertificatesController < ApplicationController
load_and_authorize_resource
	def new
		@user = User.find(params[:user_id])
	end

	def create
		@certificate = Certificate.create!(params[:certificate])
		@certifcate.user_id = params[:id]
		@certificate.save
    flash[:notice] = "#Certificate was successfully created."
    redirect_to users_path(params[:id])
	end

	def edit
		@user = User.find params[:user_id]
		@certificate = Certificate.find params[:id]
	end

	def update
		@user = User.find params[:user_id]
		@certificate = Certificate.find params[:id]
		@certificate.update_attributes(params[:certificate])
		flash[:notice] = "#{@certificate.name} was successfully updated."
    redirect_to users_path(params[:id])
	end

  def destroy
		@user = User.find params[:user_id]
    @certificate = Certificate.find(params[:id])
    @certificate.destroy
    flash[:notice] = "Certificate '#{@certificate.name}' deleted."
    redirect_to users_path(params[:id])
  end
end
