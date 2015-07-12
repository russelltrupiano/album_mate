module ApplicationHelper

    # Returns the full title ona per-page basis
    def full_title(page_title='')
        base_title = "Album Mate"
        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end
    end

    def application_title
        "Album Mate"
    end

end
