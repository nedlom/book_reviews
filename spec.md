Specs:
- [x] Using Ruby on Rails for the project 
  *app built with rails 6.1.4.1

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
  *genre has many books

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  *book belongs to genre

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many 
Items through Ingredients)
  *user has_many books through reviews
  *books has_many users through reviews

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  *user many-to-many books (see above)

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  *review content and rating submitted by user 

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  *validation for User, Book, and Review 

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  */books/:book_id/reviews

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  */books/:book_id/reviews/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  *errors displayed on page when forms submitted incorrectly

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate