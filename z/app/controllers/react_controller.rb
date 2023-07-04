class ReactController < ApplicationController
   skip_before_action :authorize, only: [:index]

   def index   
      render file: 'public/index.html', layout: false
   end
end
