Rails.application.routes.draw do
	scope "(:locale)", :locale => /en|de/ do
		root  'pages#index'
		match 'favicon',      to: 'pages#favicon',      via: 'get'
	end
	get "/datavault" => redirect("/datavault/")
	get "/notary" => redirect("/notary/")
	get "/notary-sovrin" => redirect("/notary-sovrin/")
	get "/semcon" => redirect("/semcon/")
	get "/semcon-billing" => redirect("/semcon-billing/")
	get "/semcon-validation" => redirect("/semcon-validation/")
end
