require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  context "not logged in" do
    context "on GET to :index" do
      setup do
        get :index
      end

      should_respond_with :unauthorized
    end
  end
  
  context "logged in" do
    setup do
      @user = sign_in_as
    end
    
    context "on GET to :index with no records" do
      setup do
        get :index
      end
      
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :index
      should_assign_to :recipes
    end

    context "on GET to :index with data" do
      setup do
        10.times { Factory(:recipe) }
        get :index
      end
      
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :index
      should_assign_to :recipes
    end

    context "on GET to :show" do
      setup do
        @recipe = Factory(:recipe)
        get :show, :id => @recipe.id
      end

      should_respond_with :success
      should_not_set_the_flash
      should_render_template :show
      should_assign_to :recipe
    end
    
    context "on GET to :new" do
      setup do
        get :new
      end
      
      should_respond_with :success
      should_not_set_the_flash
      should_render_template :new
      should_assign_to :recipe
    end

    context "on POST to :create with good data" do
      setup do
        @recipe = Factory.attributes_for(:recipe)
        post :create, :recipe => @recipe
      end

      should_respond_with :redirect
      should_assign_to :recipe

      should "save the recipe to the database" do
        assert Recipe.first(:conditions => { :name => @recipe[:name] })
      end
    end

    context "on POST to :create with bad data" do
      setup do
        post :create
      end

      should_respond_with :success
      should_render_template :new
      should_assign_to :recipe
    end
  end
end
