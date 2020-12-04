require_relative 'puzzle_input'
require_relative 'passport_validator'
require_relative 'batch'

def count_valid_passports(validators = PassportValidator::VALIDATORS, input = PUZZLE_INPUT)
  Batch.new(input).passports.count do |passport|
    options = { allow_missing: %i[cid], validators: validators }
    PassportValidator.new(passport, **options).valid?
  end
end
