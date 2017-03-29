class UsersController < ApplicationController
  layout 'full_width_margins'

  def show
    @user = User.find_by(:username=>params[:username].to_s)
    authorize! :read, @user
  end

  def update
    # allow user to update password (unless ldap)
    @user = User.find_by(:username=>params[:username].to_s)
    authorize! :update, @user

    respond_to do |format|
      if @user.update_attributes(user_update_params)
        flash[:notice] = 'Password Updated'
        format.html{ render :action=>:show }
        format.json{ render :json=>{},
                     :status=>:ok
        }
      else
        flash.now[:error] = 'Unable to update password'
        format.html{ render :action => :show}
        format.json{ render :json =>{},
                     :status => :unprocessable_entity
        }
      end
    end
  end

  def show_db_triggers
    authorize :read, LimeExt::DbTrigger
    @triggers = LimeExt::DbTrigger.all
  end

  def show_assignments
    @user = User.includes(:user_assignments).find_by(:username=>params[:username].to_s)
    authorize! :read, @user
    assignments = @user.user_assignments.order 'updated_at DESC'
    @active_assignments = @user.active_assignments
    @completed_assignments = @user.completed_assignments
  end

  def lime_response_syncro
    @user_assignment = UserAssignment.includes(:user).
      where(['users.username = ? AND id = ?',
             params[:username].to_s,
             params[:id].to_i])
    authorize! :read, user_assignment.user
    respond_to do |format|
      format.json{ render :json=>{:peer_data=>@user_assignment.peer_data}, :status=>:ok}
    end
  end

  private

  def user_update_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
