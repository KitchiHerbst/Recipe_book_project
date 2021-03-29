# we need to be able to allow the user to select ingredients to add to the recipe and add the amount for each ingredient
# how do we scale this to meet any number of ingredients
<%= form_for @recipe_ingredient do |f| %>
    <%= f.label :ingredient %>
    <%= f.collection_select :ingredient_id, Ingredient.all, :id, :name %>
    <%= f.label :quantity %>
    <%= f.number_field :quantity %>
<% end %>


.build ?
