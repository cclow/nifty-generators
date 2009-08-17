require 'test_helper'

class <%= session_plural_class_name %>ControllerTest < ActionController::TestCase
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    setup do
      @hash = <%= user_class_name %>.plan
      @<%= user_singular_name %> = <%= user_class_name %>.create(@hash)
      <%= session_class_name %>.find.destroy
    end

    should "render new template when authentication is invalid" do
      post :create, :<%= session_singular_name %> => { :username => @hash[:username], :password => "badgarbabe" }
      assert_template 'new'
      assert_nil <%= session_class_name %>.find
    end
    
    should "redirect when authentication is valid" do
      post :create, :<%= session_singular_name %> => { :username => @hash[:username], :password => @hash[:password] }
      assert_redirected_to root_url
      assert_equal @<%= user_singular_name %>, <%= session_class_name %>.find.<%= user_singular_name %>
    end
  end
end
