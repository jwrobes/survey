require 'faker'

module Seed

  def self.seed_users
     users = ['Jon','Jen','Hem','Jackson','Brick','Strand']
    users.each { |user| User.create({:name => user})}
  end

  def self.seed_surveys
    20.times do Survey.create({
        aha: Faker::Name.name,
        confidence: (1..5).to_a.sample,
        date: ["2014-03-28", "2014-05-28", "2014-07-28"].sample,
        user_id: (0..6).to_a.sample
      })
    end
  end

end

Seed.seed_users

Seed.seed_surveys