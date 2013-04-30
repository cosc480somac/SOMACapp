class CertificatesController < ApplicationController

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
end
