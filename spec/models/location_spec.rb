require 'rails_helper'

describe Location do
  it { should have_many(:reviews).dependent(:destroy) }
  it { should belong_to :user }

  it { should have_valid(:name).when("Boston", "San Francisco") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:state).when("MA", "CA") }
  it { should_not have_valid(:state).when(nil, "", "kssldkjf") }

  it { should have_valid(:description).when("Cities are rad.") }
  it { should_not have_valid(:description).when(nil, "") }
end
