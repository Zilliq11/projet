class SessionController < ApplicationController
  def create
    puts request.env['omniauth.auth']
    render text: request.env['omniauth.auth'].to_yaml
  end
  
end
