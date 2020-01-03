Rails.application.routes.draw do
  root to: "demo#index"
  get :benchmark, to: "demo#benchmark"
  get :test, to: "demo#test"
end
