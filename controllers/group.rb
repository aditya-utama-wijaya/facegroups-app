# frozen_string_literal: true

class Groupsters < Sinatra::Base
  get '/group/?' do
    @data = GetAllGroups.call

    slim :group
  end

  post '/group/?' do
    url_request = UrlRequest.call(params)
    result = CreateNewGroup.call(url_request)

    if result.success?
      puts "SUCCESS: #{result.value}"
    else
      error_presenter = ErrorPresenter.new(result.value)
      puts "ERROR: #{error.to_interface_message}"
    end

    redirect '/group'
  end
end
