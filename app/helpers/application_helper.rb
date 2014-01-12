module ApplicationHelper
	def inside_layout(parent_layout)
      view_flow.set :layout, capture { yield }
      render template: "layouts/#{parent_layout}"
    end

    def cp(path)
      "active" if current_page?(path)
    end
end
