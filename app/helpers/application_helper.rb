module ApplicationHelper
    def time_diff_milli(start, finish)
       (finish - start) * 1000.0
    end
    #    Returns the full title on a per-page basis.
    def full_title(page_title)
        base_title = "Poc Station"
        if page_title.empty?
            base_title
        else
            "#{base_title} | #{page_title}"
        end
    end

end
