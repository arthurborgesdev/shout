require 'application_system_test_case'

class YellsTest < ApplicationSystemTestCase
  setup do
    @yell = yells(:one)
  end

  test 'visiting the index' do
    visit yells_url
    assert_selector 'h1', text: 'Yells'
  end

  test 'creating a Yell' do
    visit yells_url
    click_on 'New Yell'

    fill_in 'Text', with: @yell.text
    fill_in 'User', with: @yell.user_id
    click_on 'Create Yell'

    assert_text 'Yell was successfully created'
    click_on 'Back'
  end

  test 'updating a Yell' do
    visit yells_url
    click_on 'Edit', match: :first

    fill_in 'Text', with: @yell.text
    fill_in 'User', with: @yell.user_id
    click_on 'Update Yell'

    assert_text 'Yell was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Yell' do
    visit yells_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Yell was successfully destroyed'
  end
end
