require "test_helper"

class FileUploadQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @file_upload_question = file_upload_questions(:one)
  end

  test "should get index" do
    get file_upload_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_file_upload_question_url
    assert_response :success
  end

  test "should create file_upload_question" do
    assert_difference("FileUploadQuestion.count") do
      post file_upload_questions_url, params: { file_upload_question: { name: @file_upload_question.name } }
    end

    assert_redirected_to file_upload_question_url(FileUploadQuestion.last)
  end

  test "should show file_upload_question" do
    get file_upload_question_url(@file_upload_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_file_upload_question_url(@file_upload_question)
    assert_response :success
  end

  test "should update file_upload_question" do
    patch file_upload_question_url(@file_upload_question), params: { file_upload_question: { name: @file_upload_question.name } }
    assert_redirected_to file_upload_question_url(@file_upload_question)
  end

  test "should destroy file_upload_question" do
    assert_difference("FileUploadQuestion.count", -1) do
      delete file_upload_question_url(@file_upload_question)
    end

    assert_redirected_to file_upload_questions_url
  end
end
