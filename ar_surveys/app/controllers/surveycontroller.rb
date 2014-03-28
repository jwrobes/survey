class SurveyController

  def self.run!
    @name = SurveyView.welcome_and_get_user
    self.execute_menu_options(self.check_user_get_option)
  end


    def self.check_user_get_option
     @user = User.find_by_name(@name)
      if @user
         SurveyView.options
      else
         SurveyView.no_user #returns blank or q
      end
    end


  def self.execute_menu_options(option)
    user = User.find_by_name(@name)
    case option
    when "2"
     survey_data = SurveyView.new_survey
     self.fill_out_survey(survey_data)
    when "1"
      SurveyView.list_user_surveys(user.surveys)
    when "q"
      nil
    else
      SurveyView.decoration
      puts 'Invalid Entry..choose 1,2 or q!'
      SurveyView.decoration
      self.execute_menu_options(self.check_user_get_option)
    end
  end

    def self.fill_out_survey(survey_data)
      survey_data[:user_id] = User.find_by_name(@name).id
      Survey.create(survey_data)
    end

end
