class SurveyController

  def self.run!
    start_choice = SurveyView.welcome_and_start
    @user = login_or_create_user(start_choice)
    account_choice = SurveyView.options
    self.execute_menu_options(account_choice)
  end



  def self.login_or_create_user(choice)
    if choice == "1"
      self.login_to_account
    elsif choice == "2"
      self.create_new_user
    elsif choice == "3"
      self.end_program  
    else
      choice = SurveyView.invalid_entry(choice)
      self.login_or_create_user(choice) 
    end
  end 

  def self.create_new_user
    new_user = View.get_new_user
    User.create(new_user)
    User.find_by_name(new_user)
  end

  def self.login_to_account
    user_name = SurveyView.get_user_name
    if check_if_user?(user_name)
      return User.find_by_name(user_name)
    else
      choice = SurveyView.invalid_user(user_name)
      self.login_or_create_user(choice)
    end
  end

  # def self.check_user_get_option
  #   @user = User.find_by_name(@name)
  #   if @user
  #      SurveyView.options
  #   else
  #      SurveyView.no_user #returns blank or q
  #   end
  # end

  def self.check_if_user?(name)
    p name
    p User.find_by_name(name).class != User
    if User.find_by_name(name).class != User
      puts "We're in the user check"
      SurveyView.invalid_user(name)  
    end  
    true
  end

  def self.execute_menu_options(option)
    user = User.find_by_name(@name)
    case option
    when "2"
     survey_data = SurveyView.new_survey
     self.fill_out_survey(survey_data)
    when "1"
      SurveyView.list_user_surveys(@user.surveys)
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
      survey_data[:user_id] = @user.id
      Survey.create(survey_data)
    end

end
