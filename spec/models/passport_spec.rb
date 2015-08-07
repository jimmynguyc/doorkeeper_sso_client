require 'rails_helper'

RSpec.describe DoorkeeperSsoClient::Passport, :type => :model do
  let(:user) { Fabricate(:user) }

  describe "associations" do
    it { is_expected.to belong_to(:identity) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_uniqueness_of(:uid) }
  end

  describe "::create_from_omniauth" do
    let(:token) { SecureRandom.hex }
    let(:passport_uid) { SecureRandom.uuid }
    let(:auth_hash) {
      HashWithIndifferentAccess.new(
        provider: 'mindvalley',
        uid: '123545',
        info: {
          first_name: 'Steve',
          last_name: 'Jobs',
          email: 'steve@apple.com'
        },
        extra: {
          passport_id: passport_uid
        },
        credentials: { token: token, refresh_token: nil, expiry: nil  }
      )
    }
    let(:fetched_passport) { DoorkeeperSsoClient::Passport.first }


    before(:each) do
      DoorkeeperSsoClient::Passport.create_from_omniauth(auth_hash)
    end

    context "new passport" do
      it { expect(DoorkeeperSsoClient::Passport.count).to eq 1 }
      it { expect(fetched_passport.uid).to eq passport_uid }
      it { expect(fetched_passport.token).to eq token }
    end

    context "update existing" do
      let!(:passport) { Fabricate("DoorkeeperSsoClient::Passport") }
      let(:token) { passport.token }
      let(:passport_uid) { passport.uid }

      it { expect(DoorkeeperSsoClient::Passport.count).to eq 1 }
      it { expect(fetched_passport.uid).to eq passport_uid }
      it { expect(fetched_passport.token).to eq token }
    end

  end

end