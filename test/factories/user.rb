FactoryGirl.define do
  factory :user do
    name 'John'
    email  'Doe_J@mail.com'
    password 'somepass123'
        
    # Child of :user factory, since it's in the `factory :user` block
    factory :admin do
      admin true
    end
  end
end