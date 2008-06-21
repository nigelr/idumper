require File.dirname(__FILE__) + '/../test_helper'

class BitsControllerTest < ActionController::TestCase
  def test_index
    
    get :index
    assert_template 'index'
    bits = assigns(:bits)
    assert_equal Bit.first.class, bits.first.class
    assert_equal(Bit.count, bits.length)
  end
  
  def test_show
    get :show, :id => Bit.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Bit.any_instance.stubs(:valid?).returns(false)
    assert_no_difference("Bit.count") do
      post :create
    end
    assert_template 'new'
  end
  
  def test_create_valid
    Bit.any_instance.stubs(:valid?).returns(true)
    assert_difference("Bit.count") do
      post :create
    end
    assert_redirected_to bit_url(assigns(:bit))
  end
  
  def test_edit
    get :edit, :id => Bit.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Bit.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Bit.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Bit.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Bit.first
    assert_redirected_to bit_url(assigns(:bit))
  end
  
  def test_destroy
    bit = Bit.first
    delete :destroy, :id => bit
    assert_redirected_to bits_url
    assert !Bit.exists?(bit.id)
  end
end
