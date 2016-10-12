module JobsHelper
  def sortable(column, company_name = nil)
  company_name ||= column.company_nameize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to company_name, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
end
end
