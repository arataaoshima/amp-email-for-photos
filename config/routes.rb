Rails.application.routes.draw do
  get 'api/success'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'api' => 'api#response'

  get '/cuisines/:student_id' => "cuisines#cuisines"

  get '/students/photos' => "cuisines#photos"
end
