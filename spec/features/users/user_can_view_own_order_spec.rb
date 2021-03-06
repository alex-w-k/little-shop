require 'rails_helper'

RSpec.feature 'User', type: :feature do
  scenario 'can view last five orders' do
    user = create(:user)
    create_list(:order, 10, user_id: user.id)

    visit(login_path)
    fill_in 'user[username]', with: user.username
    fill_in 'user[password]', with: user.password
    click_on('Submit Login')

    newest_order = Order.last
    fifth_order_id = newest_order.id - 4
    fifth_newest_order = Order.find(fifth_order_id)

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content(fifth_newest_order.id.to_s)
    expect(page).to have_content(fifth_newest_order.status)
    expect(page).to have_content(fifth_newest_order.created_at)
    expect(page).to have_content(newest_order.id.to_s)
    expect(page).to have_content(newest_order.status)
    expect(page).to have_content(newest_order.created_at)
  end

  scenario 'can view all past orders' do
    user = create(:user)
    visit(login_path)
    fill_in 'user[username]', with: user.username
    fill_in 'user[password]', with: user.password
    click_on('Submit Login')

    create_list(:order, 20, user_id: user.id)
    oldest_order = Order.first
    newest_order = Order.last

    click_on('View All Past Orders')

    expect(page).to have_current_path(orders_path)
    expect(page).to have_content(oldest_order.id.to_s)
    expect(page).to have_content(oldest_order.status)
    expect(page).to have_content(oldest_order.created_at)
    expect(page).to have_content(newest_order.id.to_s)
    expect(page).to have_content(newest_order.status)
    expect(page).to have_content(newest_order.created_at)
  end
end
