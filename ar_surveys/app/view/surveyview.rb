

class SurveyView

  class << self

    def welcome_and_get_user
      self.welcome
      puts ""
      puts ""
      self.decoration
      self.prompt_for_username
    end

    def decoration
       puts "-----"*8
    end

    def welcome
       2.times do
       puts "\e[H\e[2J"
       puts ""
       print "Welcome"
       sleep(0.2)
       end

       2.times do
       puts "\e[H\e[2J"
       puts ""
       print "Welcome to"
       sleep(0.2)
       end

       3.times do
       puts "\e[H\e[2J"
       puts ""
       print "Welcome to 'AHA moments' app for our team"
       puts ""
       print "Jon   Jen   Hem   Jackson   Brick   Strand"

       end
    end

    def prompt_for_username
      puts ""
      print "Who are You ? "
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