require File.dirname(__FILE__) + '/../test_helper'

class BitsControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  def test_should_not_show_index_when_not_logged_in
    get :index
    assert_redirected_to login_path
  end
  def test_should_show_index_when_logged_in
    login_as :quentin
    get :index
    assert_template 'index'
    bits = assigns(:bits)
    assert_equal Bit.first.class, bits.first.class
    assert_equal(Bit.count, bits.length)
  end
  
  def test_show
    login_as :quentin
    get :show, :id => Bit.first
    assert_template 'show'
  end
  
  def test_new
    login_as :quentin
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    login_as :quentin
    Bit.any_instance.stubs(:valid?).returns(false)
    assert_no_difference("Bit.count") do
      post :create
    end
    assert_template 'new'
  end
  
  def test_create_valid
    login_as :quentin
    Bit.any_instance.stubs(:valid?).returns(true)
    assert_difference("Bit.count") do
      post :create
    end
    assert_redirected_to bit_url(assigns(:bit))
  end
  
  def test_should_set_user_at_create
    login_as :quentin
    Bit.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_equal users(:quentin), Bit.last.user
  end

  def test_should_add_tags_on_create
    login_as :quentin
    Bit.any_instance.stubs(:valid?).returns(true)
    assert_difference "Tag.count", 2 do
      post :create, :bit => {:tag_list => "test, tags"}
    end
    b = Bit.last 
    assert_equal ['test', 'tags'], b.tag_list
    assert b.tag_list.include?("test")
    assert b.tag_list.include?("tags")
  end
  
  def test_edit
    login_as :quentin
    get :edit, :id => Bit.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    login_as :quentin
    Bit.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bit.first
    assert_template 'edit'
  end
  
  def test_update_valid
    login_as :quentin
    Bit.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bit.first
    assert_redirected_to bit_url(assigns(:bit))
  end
  
  def test_destroy
    login_as :quentin
    bit = Bit.first
    delete :destroy, :id => bit
    assert_redirected_to bits_url
    assert !Bit.exists?(bit.id)
  end
end
