class Job < ApplicationRecord

    # Associations
    has_many :applications, dependent: :destroy

    # Validations
    validates_presence_of :position, :requirements

end
