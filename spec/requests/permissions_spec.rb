require "rails_helper"

describe "Permissions" do
  subject(:permission) { Permission.new(user)}
  let (:user) { create(:user) }

  describe "to acceptances" do
    let (:favor) { create(:favor, user: user) }
    let (:acceptance) { create(:acceptance, user: user, favor: favor)}

    context "when has accepted acceptance" do
      it "shold not allow sending more acceptances" do
        acceptance.update_attribute(:accepted, true)
        expect(permission.allow?(:acceptances, :create, favor)).to be false
      end

      it "should not allow already-sent acceptances to be true" do
        user_two = create :user
        acceptance_two = create(:acceptance, user: user_two, favor: favor)
        acceptance.update_attribute(:accepted, true)
        expect(permission.allow?(:acceptances, :update, favor)).to be false
      end
    end
  end

  describe "to users" do
    context "when trying to edit other user's profile" do
      it "should not allow" do
        user_two = create :user
        expect(permission.allow?(:users, :update, user_two)).to be false
        expect(permission.allow?(:users, :edit, user_two)).to be false
      end
    end
    context "when trying to edit own profile" do
      it "should allow" do
        expect(permission.allow?(:users, :update, user)).to be true
        expect(permission.allow?(:users, :edit, user)).to be true
      end
    end
  end
end