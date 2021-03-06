# frozen_string_literal: true

require_relative 'producer_name_module'
require_relative 'validator'

# component of train
class Car
  include ProducerName
  include Validator

  @@number = 1

  def initialize
    set_number
  end

  TYPES = %w[cargo passenger].freeze

  def change_owner(train)
    return self.owner = train if owner.nil?

    owner.remove_car(self)
    self.owner = train
  end

  def to_s
    "Car number #{number} of #{type} type. "
  end

  protected

  attr_accessor :owner, :number

  def validate!
    validate_type!(TYPES, type)
  end

  def set_number
    self.number = @@number
    @@number += 1
  end
end
