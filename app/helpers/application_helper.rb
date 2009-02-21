# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(new_title)
    @page_title = new_title
  end

  def page_title
    [@page_title, 'Recipes'].select { |t| !t.blank? }.join(' :: ')
  end
end
