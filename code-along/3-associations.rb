# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Contact.destroy_all
# **************************

# - Insert and read contact data for companies in the database

apple = Company.find_by({"name" => "Apple"})

# 1. insert new rows in the contacts table with relationship to a company

contact = Contact.new
contact["first-name"] = "Tim"
contact["last_name"] = "Cook"
contact["email"] = "tim.cook@apple.com"
contact["company_id"] = apple["id"]
contact.save 

contact2 = Contact.new
contact2["first-name"] = "Craig"
contact2["last_name"] = "Name"
contact2["email"] = "craig.name@apple.com"
contact2["company_id"] = apple["id"]
contact2.save 

amazon = Company.find_by({"name" => "Amazon"})

contact3 = Contact.new
contact3["first-name"] = "Jeff"
contact3["last_name"] = "Bezos"
contact3["email"] = "Jeff.bezos@amazon.com"
contact3["company_id"] = amazon["id"]
contact3.save 

# 2. How many contacts work at Apple?

apple_contacts = Contact.where({"company_id" => apple["id"]})
puts "There are #{apple_contacts.count} contacts at Apple."  

# 3. What is the full name of each contact who works at Apple?

for contact in apple_contacts
    puts "#{contact["first-name"]} #{contact["last_name"]}"
end

