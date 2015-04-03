class AdminsController < ApplicationController

  def show
    id = params[:id]
    if !params[:sort] && session[:sort] then
      redirect_to :action => "show", :id => session[:user_id], :sort => session[:sort]
    end
    @admin = Admin.find(id)
    @unprocessedForms = Form.where(:processed => false)
    @processedForms = Form.where(:processed => true).order(session[:sort]);
    session[:sort] = params[:sort]
  end


  #def new
    #@admin = Admin.new
  #end

  def create
    @admin = Admin.create!(params[:admin])
    @admin.admin = 1
    @admin.save!
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    else
      render 'new'
    end
  end


end


