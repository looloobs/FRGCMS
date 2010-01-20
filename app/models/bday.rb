class Birthdays < ActiveRecord::Base
  # This script deletes all posts that are over 5 minutes old

  bdays = Soldier.find(:all, :conditions => ["strftime('%e', birth_date) LIKE ?", "01"])
  

  if bdays.size > 0
    puts "Happy Birthday!"
  else
    puts "No Birthdays Today :("
  end

end
