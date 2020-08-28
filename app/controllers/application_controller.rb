class ApplicationController < ActionController::Base
    before_action :basic, if: :production?

    protect_from_forgery with: :exception

    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from Exception, with: :render_500

    def render_404(exception = nil)
        if exception
            logger.info "Rendering 404 with exception: #{exception.message}"
        end
        render template: "errors/404", status: 404, layout: 'application'
    end

    def render_500(exception = nil)
        if exception
            logger.info "Rendering 500 with exception: #{exception.message}"
            @message = exception.message
        end
        render template: "errors/500", status: 500, layout: 'application'
    end

    private

    def production?
        Rails.env.production?
    end

    def basic
        authenticate_or_request_with_http_basic do |name, password|
            name == ENV['BASIC_AUTH_NAME'] && password == ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "production"
        end
    end
end
