module ApplicationHelper
    def inch_to_cm(inches)
        inches * 2.54
    end

    def next_page
        (@page || 0) + 1
    end
end
