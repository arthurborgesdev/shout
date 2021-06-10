require 'test_helper'

class YellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yell = yells(:one)
  end

  test 'should get index' do
    get yells_url
    assert_response :success
  end

  test 'should get new' do
    get new_yell_url
    assert_response :success
  end

  test 'should create yell' do
    assert_difference('Yell.count') do
      post yells_url, params: { yell: { text: @yell.text, user_id: @yell.user_id } }
    end

    assert_redirected_to yell_url(Yell.last)
  end

  test 'should show yell' do
    get yell_url(@yell)
    assert_response :success
  end

  test 'should get edit' do
    get edit_yell_url(@yell)
    assert_response :success
  end

  test 'should update yell' do
    patch yell_url(@yell), params: { yell: { text: @yell.text, user_id: @yell.user_id } }
    assert_redirected_to yell_url(@yell)
  end

  test 'should destroy yell' do
    assert_difference('Yell.count', -1) do
      delete yell_url(@yell)
    end

    assert_redirected_to yells_url
  end
end
