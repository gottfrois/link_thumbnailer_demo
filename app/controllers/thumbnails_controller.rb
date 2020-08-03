require 'options_parser'

class ThumbnailsController < ApplicationController
  def create
    @thumbnail = ::LinkThumbnailer.generate(params[:url], options)

    render json: @thumbnail
  rescue ::URI::InvalidURIError, ::Net::HTTPServerException => e
    render json: { error: e.message }, status: 422
  rescue ::LinkThumbnailer::Exceptions => e
    render json: { error: e.message }, status: 400
  end

  private

  def options
    ::OptionsParser.new(params.fetch(:options, {})).call
  end
end
