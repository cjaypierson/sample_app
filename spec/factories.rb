FactoryGirl.define do
	factory :user do
		name "Ed Sullivan"
		email "ed1@example.com"
		password "foobar"
		password_confirmation "foobar"
	end
end