class Application < ApplicationRecord

    # Associations
    belongs_to :job

    # Validations
    validates_presence_of(:name, :job_id, :justifications, :code)
end
