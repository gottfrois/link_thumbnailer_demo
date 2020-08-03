class OptionsParser

  attr_reader :params, :options

  def initialize(params = {})
    @params  = params
    @options = {}
  end

  def call
    parse_integers_options
    parse_other_options

    options
  end

  private

  def parse_integers_options
    integers_options.each do |name|
      value = params.delete(name)
      options[name] = value.to_i if value
    end
  end

  def parse_other_options
    options[:attributes]  = params[:attributes] if params[:attributes]
    options[:image_stats] = params[:image_stats] == 'false' ? false : true unless params[:image_stats].nil?
  end

  def integers_options
    %w(image_limit redirect_limit description_min_length).map(&:to_sym)
  end
end
