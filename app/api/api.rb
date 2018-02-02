class API < Grape::API
	prefix 'api'
	version 'v1', using: :path
	format :json
	
  mount Artists::GetArtists


  add_swagger_documentation(
      base_path: "/",
      hide_documentation_path: true,
      api_version: 'v1'
    )end
