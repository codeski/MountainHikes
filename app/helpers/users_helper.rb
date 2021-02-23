module UsersHelper

    def display_saved_links(user)
        if user.links.count > 0 
           render partial: "links/link", collection: user.links
        else 
            "(You have no saved mountains)"
        end 
    end

    def display_user_hikes(user)
        if user.hikes.count > 0
            render partial: 'hikes/user_hikelist', collection: user.hikes.order_by_date
        else 
            link_to "Find your first mountain to hike", mountains_path
        end
    end

    def user_review?(user, mountain)
        if hike = user.hike?(user, mountain)
            "You have already reviewed this mountain"
        else 
            link_to "Review #{mountain.name} hike", new_mountain_hike_path(mountain)
        end
    end

    def user_linked?(u, m)
        if link = u.links.where(mountain_id: m.id).first  
            "Link saved to profile"
        else
            button_to "Save this hike", mountain_links_path(m, link: { mountain_id: m.id, user_id: u.id })
        end
    end

    def admin_mountain_edit(user, m)
        if user.admin
            link_to "Edit Mountain", edit_mountain_path(m)
        end
    end

    def admin_mountain_delete(user, m)
        if user.admin
            form_tag(mountain_path(m.id), method: :delete) do
                submit_tag "Delete Mountain"
            end
        end
    end
 

    
end
