class AdminsController < UsersController

  def show
    form_sorting_for_show()
    @user = Admin.find(params[:id])
    @stat = view_context.get_statistics    #view_context = ApplicationHelper or any Helper
  end


  def create
    @admin = Admin.create!(params[:admin])
    @admin.reactivate
    if @admin.save
      flash[:success] = "Admin created successfully!"
      redirect_to admin_path(session[:user_id])
    # else
    #   render 'new'
    end
  end

  def manage_accounts
    @user = Admin.find(session[:user_id])
    @stat = view_context.get_statistics    #view_context = ApplicationHelper or any Helper
    if params[:deactivate] then
      User.find(params[:deactivate]).deactivate
    end
    if params[:reactivate] then
      User.find(params[:reactivate]).reactivate
    end
    @active_users = User.find_all_by_active(true)
    @inactive_users = User.find_all_by_active(false)
  end
end


