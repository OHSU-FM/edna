class SettingsController < ApplicationController
  layout 'full_width_margins'
  before_filter :require_auth

  def show; end
  def show_users; end
  def show_permissions_groups; end
  def show_role_aggregates; end
  def show_assignments; end

  private
  def require_auth
    authorize! :manage, :all
  end

end
