require "application_system_test_case"

class FileUploadQuestionsTest < ApplicationSystemTestCase
  setup do
    @file_upload_question = file_upload_questions(:one)
  end

  test "visiting the index" do
    visit file_upload_questions_url
    assert_selector "h1", text: "File upload questions"
  end

  test "should create file upload question" do
    visit file_upload_questions_url
    click_on "New file upload question"

    fill_in "Name", with: @file_upload_question.name
    click_on "Create File upload question"

    assert_text "File upload question was successfully created"
    click_on "Back"
  end

  test "should update File upload question" do
    visit file_upload_question_url(@file_upload_question)
    click_on "Edit this file upload question", match: :first

    fill_in "Name", with: @file_upload_question.name
    click_on "Update File upload question"

    assert_text "File upload question was successfully updated"
    click_on "Back"
  end

  test "should destroy File upload question" do
    visit file_upload_question_url(@file_upload_question)
    click_on "Destroy this file upload question", match: :first

    assert_text "File upload question was successfully destroyed"
  end
end
