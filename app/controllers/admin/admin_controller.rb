class Admin::AdminController < ApplicationController
  # use an admin-specific layout instead of the main application layout
  layout "admin" 

  before_action :authenticate_admin!

  def authenticate_admin!
		if user_signed_in?
			unless (current_role.include? "admin")
				redirect_to root_path, alert: "You are not authorized"
			end
		else
			redirect_to admin_dashboard_index_path
		end
  end
end