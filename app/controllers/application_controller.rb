class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
  	case resource
	    when Restaurant
	      admin_restaurant_top_path
	    when User
	      root_path
	    end
	end
  end
  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    if $g_is_deleted
      $g_is_deleted = false
      new_user_registration_path
    else
      root_path
    end
end
