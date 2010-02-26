authorization do

  role :admin do
    has_permission_on [:battalions, :companies, :messages], :to => [:index, :show, :new, :create, :edit, :update, :destroy] 
  end
  
  role :battalion do
    has_permission_on [:companies], :to => [:new, :create, :show, :edit, :update]
    has_permission_on [:messages], :to => [:new, :create, :index, :show, :edit, :update]
    has_permission_on [:battalions], :to => [:show, :edit, :update] do
      if_attribute :id => is {user.battalion.id}
    end
  end
  
  role :company do
    has_permission_on [:companies], :to => [:show, :edit, :update] 
    has_permission_on [:messages], :to => [:new, :index, :show, :edit, :update] 
  end
  
  role :poc do
    has_permission_on [:platoons], :to => [:show] do
      if_attribute :id => is {user.platoon.id}
    end
  end
  
  role :trnco do
    has_permission_on [:companies], :to => [:show, :edit, :update] do
      if_attribute :id => is {user.company.id}
    end
  end
  
end
  
