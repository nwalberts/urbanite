require 'rails_helper'

describe Review do
  it { should belong_to :user }
  it { should belong_to :location }

  it { should have_valid(:rating).when("5", "1") }
  it { should_not have_valid(:rating).when(nil, "", "6") }

  it { should have_valid(:body).when("Great city!", "What a pile of garbage.", nil, "") }

end
