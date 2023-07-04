class ReactController < ActionController::Base
   # skip_before_action :authorize, only: [:index]

   def index   
      # render file: 'public/index.html', layout: false
      render file: 'public/index.html'

   end
end
