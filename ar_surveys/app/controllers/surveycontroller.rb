class SurveyController

  def self.run!
    start_choice = SurveyView.welcome_and_start
    @user = login_or_create_user(start_choice)
    account_choice = SurveyView.display_options(@user.name)
    self.execute_menu_options(account_choice)
  end

  def self.login_or_create_user(choice)
    if choice == "1"
      self.login_to_account
    elsif choice == "2"
      self.create_new_user
    elsif choice == "3"
      abort
    else
      choice = SurveyView.invalid_entry(choice)
      self.login_or_create_user(choice) 
    end
  end 
  
  def self.create_new_user
    new_user = SurveyView.get_new_user
    User.create(:name => new_user)
    User.find_by_name(new_user)
  end

  def self.login_to_account
    user_name = SurveyView.get_user_name
    if check_if_user?(user_name)
      return User.find_by_name(user_name)
    else
      choice = SurveyView.invalid_user(user_name)
      self.run!
    end
  end

  def self.check_if_user?(name)  
    User.find_by_name(name).class == User
  end

  def self.execute_menu_options(option) 
    case option
    when "1"
      SurveyView.list_user_surveys(@user.surveys)
      account_choice = SurveyView.display_options(@user.name)
      self.execute_menu_options(account_choice)
    when "2"
      survey_data = SurveyView.new_survey
      account_choice = SurveyView.display_options(@user.name)
      self.execute_menu_options(account_choice)
    when "q"
      nil
    else
      SurveyView.decoration
      puts 'Invalid Entry..choose 1,2 or q!'
      SurveyView.decoration
      account_choice = SurveyView.display_options(@user.name)
      self.execute_menu_options(account_choice)
    end
  end


    def self.fill_out_survey(survey_data)
      survey_data[:user_id] = @user.id
      Survey.create(survey_data)
    end

end
