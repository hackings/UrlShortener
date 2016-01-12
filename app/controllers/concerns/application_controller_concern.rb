module ApplicationControllerConcern
  extend ActiveSupport::Concern
  include ActionController::ImplicitRender

  included do
    respond_to :json
    
    before_action :set_cache_headers
    before_action :set_build_header

    rescue_from Exception, with: :render_generic_exception
    rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
    rescue_from ActionController::UnknownFormat, with: :render_unknown_format
    rescue_from ActionController::ParameterMissing, with: :render_parameter_missing

    def _version
      @_version ||= self.class.name.split('::')[0..-2].join('::').constantize
    end
    # API errors. You can pass:
    #  :message
    #  :description
    #  :status
    def render_error(options)
      error = {message: options[:message]}
      error[:description] = options[:description] if options[:description]
      error[:exceptions] = options[:exceptions] if options[:exceptions]
      status = options[:status] || :bad_request

      render json: error, status: status 
    end

    private

    def set_cache_headers
      response.headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
      response.headers['Pragma'] = 'no-cache'
      response.headers['Expires'] = '0'
    end

    def set_build_header
      response.headers['X-API-Version'] = "#{_version.to_s.downcase}"
    end

    def render_record_not_found(ex)
      render_error message: 'Record not found', description: ex.message, status: :bad_request
    end

    def render_unknown_format(ex)
      head 406
    end

    def render_parameter_missing(ex)
      render_error message: 'You are missing a required parameter', description: "#{ex.message}", status: :bad_request
    end

    def render_generic_exception(ex)
      render_error(
        message: "An error that we didn't expect. We will look in to it!",
        description: "#{ex.class.name}: #{ex.message}",
        exceptions: (ex.backtrace[0, 30] unless Rails.env.production?),
        status: :internal_server_error
      )

      Rails.logger.error(ex.message)
      ex.backtrace[0, 30].each do |error|
        Rails.logger.error(error)
      end
    end

  end
end
