module UsersHelper

    def display_saved_links(user)
        if user.links 
            user.links.each do |l| 
                "#{link_to l.mountain.name, mountain_path(l.mountain)}"
                form_tag(link_path(l), method: :delete) do 
                    "#{ submit_tag "Unsave Link"}"
                end
            end 
        else 
            "You have no saved mountains"
        end 
    end

    # if user.links 
    #     user.links.each do |l| 
    #         link_to l.mountain.name, mountain_path(l.mountain)
    #         form_tag(link_path(l), method: :delete) do 
    #              submit_tag "Unsave Link"
    #         end 
    #     end 
    # else 
    #     "You have no saved mountains"
    # end 

end
