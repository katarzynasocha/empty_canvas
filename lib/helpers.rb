class EmptyCanvas
  module Helpers

    def erb_or_haml(view)
      begin
        erb view, :layout => :layout
      rescue
        haml view, :layout => :layout
      end
    end

    def lorem(*params)
      *params = :sentence if params.empty?

      options = params.last.is_a?(Hash) ? params.pop : {}
      options.merge!(:html => true)

      Forgery(:lorem_ipsum).text(*params, options)
    end

    def lorem_picture(params = {})
      source_array = ['http://lorempixel.com']

      source_array << '/g' if params[:grey]

      source_array << (params[:width] || 300).to_s
      source_array << (params[:height] || 200).to_s

      source_array << params[:category].to_s

      src = source_array.join('/')

      "<img src=\"#{src}\" alt=\"an image\" />"
    end

  end
end
