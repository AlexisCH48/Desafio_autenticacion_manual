module ApplicationHelper

    def logged?
        if current_user.present?
            return true
        else
            return false
        end
    end

    def current_user
        if session[:user_id].present?
            @user = User.find(session[:user_id])
            return @user
        else
            return nil
        end
    end
end
