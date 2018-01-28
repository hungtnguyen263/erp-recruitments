Erp::Recruitments::Engine.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
		namespace :backend, module: "backend", path: "backend/recruitments" do
      resources :recruitments do
        collection do
          post 'list'
          put 'set_active'
          put 'set_deleted'
        end
      end
      resources :recruit_applications do
        collection do
          post 'list'
          put 'set_active'
          put 'set_deleted'
        end
      end
    end
  end
end