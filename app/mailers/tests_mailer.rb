class TestsMailer < ApplicationMailer

  def completed_tes(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email
  end

end
