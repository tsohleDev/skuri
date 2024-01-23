require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Address1", with: @order.address1
    fill_in "Address2", with: @order.address2
    fill_in "City", with: @order.city
    fill_in "Cost", with: @order.cost
    fill_in "Customer", with: @order.customer_id
    fill_in "Postal code", with: @order.postal_code
    fill_in "State", with: @order.state
    fill_in "Status", with: @order.status
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Address1", with: @order.address1
    fill_in "Address2", with: @order.address2
    fill_in "City", with: @order.city
    fill_in "Cost", with: @order.cost
    fill_in "Customer", with: @order.customer_id
    fill_in "Postal code", with: @order.postal_code
    fill_in "State", with: @order.state
    fill_in "Status", with: @order.status
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
