# we need to be able to allow the user to select ingredients to add to the recipe and add the amount for each ingredient
# how do we scale this to meet any number of ingredients
<%= form_for @recipe_ingredient do |f| %>
    <%= f.label :ingredient %>
    <%= f.collection_select :ingredient_id, Ingredient.all, :id, :name %>
    <%= f.label :quantity %>
    <%= f.number_field :quantity %>
<% end %>

# was inside the fields_for :recipe_ingredients
, @recipe.recipe_ingredients.build


## from recipe new
<%= form_for @recipe do |f| %>
	<%= f.label :name %>
	<%= f.text_field :name %><br><br>
<br>

    <%= f.fields_for :recipe_ingredients do |recipe_ingredients_fields| %>
        <%= recipe_ingredients_fields.collection_select :ingredient_id, Ingredient.all, :id, :name %>
        <%= recipe_ingredients_fields.number_field :quantity %>
    <% end %>
<br>
<%= f.submit %>
<%= f.submit %>
<%= f.submit %>

<% end %>
###


#creating a recipe that can have multiple ingredients
#
<%= form_for @recipe do |f| %>

	<%= f.label :name %>
	<%= f.text_field :name %><br><br>

	<%= f.collection_check_boxes :ingredient_id, Ingredient.all, :id, :name %><br>

    <%= f.fields_for :ingredients do |ingredient| %>
        <%= ingredient.label :name  %>
      <%= ingredient.text_field :name %>
    <% end %>

	<%= f.submit %>
<% end %>

<%= form_tag ingredients_path do %>
    <%= label_tag :name %>
    <%= text_field_tag :name %>
    <%= submit_tag "Add Ingredient" %>
    <% end %>
    <% @recipe.ingredients.each do |ingredient| %>
    <%= form_tag(ingredient_path(ingredient), method: :patch) do %>
    <%= label_tag :name %>
    <%= text_field_tag :name, value = "#{ingredient.name}" %>
<% end %>
<% end %>

<%= form_for @recipe do |f| %>
    <%= f.label :name %>
    <%= f.text_field :name %>
    <%= f.submit %>
<% end %>

<%= f.collection_check_boxes :ingredients, Ingredient.all, :id, :name %><br>

<%= form_for @recipe_ingredient do |f| %>
	<%= f.label :ingredient %>
	<%= f.collection_select :ingredient_id, Ingredient.all, :id , :name %>
    <%= f.label :quantity %>
    <%= f.number_field :quantity %>
    

    <%= render 'form' %>