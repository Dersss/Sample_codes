require 'rails_helper'

# Test environment for the Job Model
RSpec.describe Job, type: :model do
  it { should have_many(:applications).dependent(:destroy) }

  # Ensure that position and requirements attributes are required
  it { should validate_presence_of(:position) }
  it { should validate_presence_of(:requirements) }
end


