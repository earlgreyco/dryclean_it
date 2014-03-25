module ApplicationHelper
	#Returns full title on a per-page basis.
	def full_title(page_title)
		base_title = "Dryclean It"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def highlight(path)
		"menu-item-divided pure-menu-selected" if current_page?(path)
	end

	def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    if !current_user?(@user)
      flash[:error] = "Sign in to the right account first!"
      redirect_to(root_url)
    end
  end

  def admin_user
  	if !current_user.admin?
  		flash[:error] = "Sign in to the right account first!"
  	end
    redirect_to(root_url) unless current_user.admin?
  end
end
