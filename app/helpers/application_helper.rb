module ApplicationHelper

    def admin?(user)
        if user.admin 
            link_to "Create Mountain", new_mountain_path 
        end 
    end

end
