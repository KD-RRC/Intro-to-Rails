class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  def render_not_found
    render html: "<div class='container mt-4'><h1>Page not found</h1><p>Sorry, we couldn't find what you were looking for. <a href='/'>Return home</a>.</p></div>".html_safe, status: :not_found
  end
end