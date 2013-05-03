class UsersController < ApplicationController
load_and_authorize_resource
	def index
		@users = User.all
		@positions = Position.all
		sort = params[:sort] || session[:sort]
		if sort == 'firstname'
			@users = User.order("first_name ASC")
		elsif sort == 'lastname'
			@users = User.order("last_name ASC")
		end
		@all_positions = Position.all_titles
		@selected_positions = params[:positions] || session[:positions] || {}

		if @selected_positions == {}
			@selected_positions = Hash[@all_positions.map {|position| [position, position]}]
		elsif @selected_positions != {}
			@users = []
			@positions = Position.find_all_by_title(@selected_positions.keys)
			@positions.each do |position|
				@users << User.find(position.user_id)
			end
		end
	end

  def new
    # default: render 'new' template
  end

  def create
    redirect_to users_path
  end

  def show
    id = params[:id] # retrieve user ID from URI route
    @user = User.find(id) # look up user by unique ID
    # will render app/views/user/profile.<extension> by default
		@positions = Position.find_all_by_user_id(id)
		@certification = Certificate.find_all_by_user_id(id)
  end

  def edit
    @user = User.find params[:id]
		@positions = Position.find_all_by_user_id(@user.id)
		@selected_positions = []
		@positions.each do |position|
			@selected_positions << position.title
		end
		@all_positions = Position.all_titles
  end

  def update
    @user = User.find params[:id]
    authorize! :assign_roles, @user if params[:user][:assign_roles]

    @user.update_attributes!(params[:user])
		# check if all params[:positions] are in the positions table
		# if not add them.
		@all_positions = Position.all_titles
		@pos = params[:positions] || []
		@positions = []
		@pos.each do |position|
			@positions << position[0]
		end
		@not_positions = @all_positions - @positions
		# adds all positions that do not exist for user
		@positions.each do |position|
			if Position.find_by_user_id_and_title(@user.id, position) == nil
				Position.create!(:title => position, :user_id => @user.id)
			end
		end
		# delete all positions that no longer exist for user
		@not_positions.each do |position|
			if Position.find_by_user_id_and_title(@user.id, position) != nil
				p = Position.find_by_user_id_and_title(@user.id, position)
				p.destroy
			end
		end
    flash[:notice] = "#Profile was successfully updated."
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to users_path
  end

end

