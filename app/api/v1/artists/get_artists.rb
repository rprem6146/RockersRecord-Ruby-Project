require 'doorkeeper/grape/helpers'
require 'grape-swagger'
module Artists
  class GetArtists < Grape::API
    helpers Doorkeeper::Grape::Helpers
    version 'v1'
    format :json    
    resource :artists do  
     
     desc 'Get Artists'
      get '/' do
        artists =  Artist.all
        {success: true, artists: artists}
      end
     end 

  end
end