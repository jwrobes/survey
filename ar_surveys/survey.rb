require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"


#CONTROLLER

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
      puts "Invalid Entry"
      SurveyView.options # this will not actually work
    else
      puts 'End of Program' #How to exit program
    end
  end




    def self.fill_out_survey(survey_data)
      survey_data[:user_id] = User.find_by_name(@name).id
      Survey.create(survey_data)
    end

end

class SurveyView

  class << self

    def welcome_and_get_user
      self.welcome
      self.decoration
      self.prompt_for_username
    end

    def decoration
       puts "*"*75
    end

    def welcome
       puts "Welcome to Surveys"
    end

    def prompt_for_username
       print "Enter Username: "
       @name = gets.chomp
    end

    def list_user_surveys(user_surveys)
        decoration
        user_surveys.each do |survey|
                   puts "Survey ID: #{survey.id}"
          puts "Confidence: #{survey.confidence}"
          puts "Aha: #{survey.aha}"
          decoration
        end

    end

    def new_survey
      puts "Aha moment:"
      aha = gets.chomp
      puts "confidence level from 1-5"
      confidence = gets.chomp
      result = {:aha => aha, :confidence => confidence.to_i}

      # result[:user_id] = User.find_by_name(@name).id
      # Survey.create(result)
    end

    def options
     puts "1. See past survey results"
     puts "2. Take a survey"
     puts "q to Exit"
     print "Choose an option: "
     @choice = gets.chomp
    end

    def no_user
      puts "username does not exist. press enter to try again or 'q' to quit."
      @option = gets.chomp
    end
  end
end

SurveyController.run!













