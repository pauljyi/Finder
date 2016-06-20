module ApplicationHelper

  # Setting defaults for sorting
  def sort_column
    Event.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


	def sortable(column, title = nil)
	    title ||= column.titleize
	    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	    link_to title, :sort => column, :direction => direction
	end

end
