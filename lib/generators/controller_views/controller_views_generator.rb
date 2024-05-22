class ControllerViewsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("templates", __dir__)

  def create_views
    html_views.concat(turbo_stream_views).each do |view|
      template view, "app/views/#{plural_file_name}/#{view}"
    end
  end

  private
  def html_views
    html_views = ["_fields", "_form", "_list", "index", "show"]
    views = []
    html_views.each do |view|
      views << add_file_extension(view, :html)
    end
    views
  end

  def turbo_stream_views
    turbo_stream_views = ["create", "edit", "new", "update"]
    views = []
    turbo_stream_views.each do |view|
      views << add_file_extension(view, :turbo_stream)
    end
    views
  end

  def add_file_extension(filename, extension = "")
      "#{filename}.#{extension.to_s}.erb"
  end
end
