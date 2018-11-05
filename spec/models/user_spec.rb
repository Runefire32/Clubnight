require 'rails_helper'

RSpec.describe User, :type => :model do

  it "is valid with valid attributes" do
   user = User.new(fist_name:"Ugo", last_name:"Gessa", email:"i.am.ugogessa@gmail.com", password: "motdepasse", password_confirmation: "motdepasse")
   expect(user).to be_valid
  end

  it "is not valid without a first_name" do
     expect(User.new(fist_name: nil, last_name:"Gessa", email:"i.am.ugo@gmail.com", password: "motdepasse", password_confirmation: "motdepasse")).to_not be_valid
  end

  it "is not valid without a last_name" do
       expect(User.new(fist_name: "Ugo", last_name: nil, email:"i.am.ugo@gmail.com", password: "motdepasse", password_confirmation: "motdepasse")).to_not be_valid
  end

  it "is not valid without a unique email" do
    	@user1 = User.new(fist_name: "Example",last_name:"User", email: "user@example.com", password: "motdepasse", password_confirmation: "motdepasse")
 		@user2 = User.new(fist_name: "Example",last_name:"User", email: "user@example.com", password: "motdepasse", password_confirmation: "motdepasse")

  	   	@user1.save
  	   	@user2.save
  	   	expect(@user2).to_not be_valid
  end


  
end