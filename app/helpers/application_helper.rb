module ApplicationHelper
	#Returns full title on a per-page basis.
	def full_title(page_title)
		base_title = "The Sarmander"
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
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
  	if !current_user.admin?
  		flash[:error] = "Hey, silly - you're not an admin! =P"
  	end
    redirect_to(root_url) unless current_user.admin?
  end
end
