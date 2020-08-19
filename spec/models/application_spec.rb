require 'rails_helper'

RSpec.describe Application, type: :model do
  it { should belong_to(:job) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:justifications) }
  it { should validate_presence_of(:job_id) }
  it { should validate_presence_of(:code) }
end
