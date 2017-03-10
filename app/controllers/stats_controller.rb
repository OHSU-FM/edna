class StatsController < ApplicationController
    layout 'full_width'
  @@years = [2007, 2008, 2009, 2010, 2011, 2012]

  def index
    authorize! :read, :stats 
    if current_user.admin_or_higher?
        redirect_to show_stat_path(:id=>'A', :year=>@@years.last)
    elsif current_user.p4_program.nil? || current_user.p4_program.alias.nil?
        render :file => File.join(Rails.root, 'public', '401.html')
    else
        redirect_to show_stat_path(:id=>current_user.p4_program.alias, :year=>@@years.last)
    end

  end

  def show
    authorize! :read, :stats 

    # Force non admins to view their own content
    if current_user.admin_or_higher? || current_user.p4_program.alias == params[:id]
        # set type
        @id = params[:id]
    elsif current_user.p4_program && current_user.p4_program.alias
        redirect_to show_stat_path(:id=>current_user.p4_program.alias, :year=>@@years.last)
        return
    else
        render :file => File.join(Rails.root, 'public', '401.html')
        return
    end
    
    @year = params[:year].to_i
    @years = @@years
    if @year.nil? || @@years.include?(@year) == false
        redirect_to show_stat_path(:id=>@id, :year=>@@years.last)
        return
    end

    if current_user.admin_or_higher?
        @select_data = MetaAttribute::MetaAttributeStatistic.
            select(:subset_id).
            order(:subset_id).
            group(:subset_id).collect { |a| 
                ["Program #{a.subset_id}", a.subset_id] 
            }
        @select_data.push ['All Programs', 0 ]
    else
        @select_data = [@id]
    end

  end


end
