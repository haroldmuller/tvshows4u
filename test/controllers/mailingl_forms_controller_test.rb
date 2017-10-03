require 'test_helper'

class MailinglFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mailingl_form = mailingl_forms(:one)
  end

  test "should get index" do
    get mailingl_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_mailingl_form_url
    assert_response :success
  end

  test "should create mailingl_form" do
    assert_difference('MailinglForm.count') do
      post mailingl_forms_url, params: { mailingl_form: { body: @mailingl_form.body, subject: @mailingl_form.subject, to: @mailingl_form.to } }
    end

    assert_redirected_to mailingl_form_url(MailinglForm.last)
  end

  test "should show mailingl_form" do
    get mailingl_form_url(@mailingl_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_mailingl_form_url(@mailingl_form)
    assert_response :success
  end

  test "should update mailingl_form" do
    patch mailingl_form_url(@mailingl_form), params: { mailingl_form: { body: @mailingl_form.body, subject: @mailingl_form.subject, to: @mailingl_form.to } }
    assert_redirected_to mailingl_form_url(@mailingl_form)
  end

  test "should destroy mailingl_form" do
    assert_difference('MailinglForm.count', -1) do
      delete mailingl_form_url(@mailingl_form)
    end

    assert_redirected_to mailingl_forms_url
  end
end
