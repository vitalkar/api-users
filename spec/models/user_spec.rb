require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user should be created" do
    
    it "should be truthy" do 
      user = create(:user)
      # puts user.inspect
      expect(user).not_to be_nil 
      expect(user).to be_an_instance_of(User)
      expect(user).to be_valid
    end
  end

end
