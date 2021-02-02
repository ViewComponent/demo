Rails.application.routes.draw do
  root to: "demo#index"
  get :css, to: "demo#css"
  get :benchmark, to: "demo#benchmark"
end
