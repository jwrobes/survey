require_relative 'config/application'

puts "Put your application code in #{File.expand_path(__FILE__)}"


#MODEL
class SurveyModel

def check_username(username)
  if object.username == username

  end

  def take_new_survey

end

#CONTROLLER

class SurveyController

  def initialize
    survey = SurveyModel.new
  end


  def self.run!
    @username = SurveyView.welcome_and_get_user
    SurveyView.check_user
    SurveyView.menu
  end

end

class SurveyView

  class << self


    def welcome_and_get_user
      welcome
      decoration
      prompt_for_username
    end

    def decoration
       "*" * 25
    end

    def welcome
       puts "Welcome to Surveys"
    end

    def prompt_for_username
       print "Enter Username: "
       @username = gets.chomp
    end

    def check_user
     @user = User.find_by_name(@username)
       if @user
         options
       else
         no_user
         if @option != "q"
           run!
         end
       end
     end

    def menu(choice)
     case @choice
     when 1
       p "show_past_results"
     when 2
       new_survey
     else
       puts "Invalid entry"
       options
       menu
     end
    end

    def new_survey
      puts "Aha moment:"
      aha = gets.chomp
      puts "confidence level from 1-5"
      confidence = gets.chomp
      results =
    end

    def options
     puts "Choose an option. Enter 1 to see past survey results or 2 to take a new survey"
     @choice = gets.chomp
    end

    def no_user
      puts "username does not exist. press enter to try again or 'q' to quit."
      @option = gets.chomp
    end
  end
end















