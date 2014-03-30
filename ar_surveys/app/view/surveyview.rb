

class SurveyView

  class << self

    def welcome_and_start
      self.welcome
      puts ""
      puts ""
      self.decoration
      self.prompt_for_choice
    end

    def decoration
       puts "-----"*8
    end

    def welcome
       puts "Welcome to the Aha Moments App"
    end

    def prompt_for_choice
      puts ""
      puts "You have two options:"
      puts "   1. Login to Account"
      puts "   2. Create new Account"
      puts "   3. Quit the App"
      #your name if you have a User Account or type 'new' to create a new account"
      gets.chomp
    end

    def get_user_name
      puts "Enter user name"
      gets.chomp
    end

    def invalid_entry(choice)
      puts ""
      puts "You entered: #{choice}"
      puts "This is an invalid entry."
      prompt_for_choice
    end

    def invalid_user(user_name)
      puts "#{user_name} is not a valid user."
      self.prompt_for_choice
    end

    # def prompt_for_username
    #   puts ""
    #   puts "You have two options:"
    #   puts "   1. Login to Account"
    #   puts "   2. Create new Account"
    #   #your name if you have a User Account or type 'new' to create a new account"
    #   @name = gets.chomp
    #   if @name = "new"
    #     self.new_user
    #   end
    #   @name
    # end

    def get_new_user
      puts "Enter New Username:"
      name = gets.chomp
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
      puts "\e[H\e[2J"
      puts ""
      print "Your Aha moment:"
      aha = gets.chomp
      puts ""
      print "Confidence level from 1-5: "
      confidence = gets.chomp
      puts ""
      result = {:aha => aha, :confidence => confidence.to_i}
    end

    def options
     puts "\e[H\e[2J"
     puts ""
     puts "1. See past AHA moments"
     puts "2. Save your AHA moment"
     puts "q to Exit"
     print "Choose an option: "
     @choice = gets.chomp
    end

    def no_user
      puts "\e[H\e[2J"
      puts ""
      puts "username does not exist. press enter to try again or 'q' to quit."
      @option = gets.chomp
      # SurveyController.run!
    end
  end
end