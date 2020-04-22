# pizza-delivery-rails-api

# portfolio-rails-api-only
portfolio-rails-api-only
REFRENCE: https://medium.com/otavio-henrique/creating-simple-rest-api-with-rails-5-1ba71b37cad

# 1. creating API only app
rails new library --api -d postgresql -T

# 2. Installing Rspec
group :development, :test do
  gem 'rspec-rails', '~> 3.6'
end

# 3. add factory girl to your gemfile
gem 'factory_girl'

# 4. Setting API Versioning
gem 'versionist'

# 5. Creating version in a namespace in routes.rb
rails generate versionist:new_api_version v1 V1 --path=value:v1

# 6. Creating Models & Controllers under respective version directory

# 7. defining resources in routes.rb
resources :books

# 8. defining CRUD methods in controllers 

# Model Creation Sample (Auto foreign key and association created)
rails g model Product name:string description:text amount:integer admin:references

# Making Controllers and views with scaffold
rails g controller super_admin/admin index show new create edit update destroy

# Model Creation Sample (Auto foreign key and association created)
rails g model Product name:string description:text amount:integer admin:references

# removing columns from table using migration
rails generate migration RemoveAdminIdFromAnimals admin_id:bigint

# add column in table using migration
rails generate migration add_email_to_users email:string

# update column name - rails g migration UpdateColumnVendors
rename_column :table, :old_column, :new_column

# Joins
products = Product.joins(:types)

# update column type to datetime - rails g migration change_date_string_to_datetime
def change
    remove_column :payments, :date
    add_column :payments, :date, :datetime
end