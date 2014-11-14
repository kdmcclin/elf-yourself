require 'rails_helper'

describe User do
	let(:user1) {User.new(email: "santa@northpole.com", username: "santa", password: "northpole")}
	let(:user2) {User.new(email: nil, username: "santa", password: "northpole")}
	let(:user3) {User.new(email: "elf@northpole.com", username: nil, password: "iamanelf")}
	let(:user4) {User.new(email: "mrsclaus@northpole.com", username: "mrsclaus", password: nil)}
	let(:user5) {User.new(email: "elf@northpole.com", username: "thebigelfoncampus", password: "iamanelf")}

	it "is valid with an email, username, and password" do
		expect(user1).to be_valid
	end

	it "is invalid without an email" do
		user2.valid?
		expect(user2.errors[:email]).to include("can't be blank")
	end

	it "is invalid without a username" do
		user3.valid?
		expect(user3.errors[:username]).to include("can't be blank")
	end

	it "is invalid without a password" do
		user4.valid?
		expect(user4.errors[:password]).to include("can't be blank")
	end

	it "is invalid with a duplicate email address" do
		User.create(email: "elf@northpole.com", username: "chiefelf", password: "iamanelf")

		user5.valid?
		expect(user5.errors[:email]).to include("has already been taken")
	end
end