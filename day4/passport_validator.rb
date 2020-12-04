class PassportValidator
  REQUIRED_FIELDS = %i[byr iyr eyr hgt hcl ecl pid cid]
  DEFAULT_VALIDATOR = ->(value) { true }
  VALIDATORS = {
    byr: ->(val) { (1920..2002).include? val.to_i },
    iyr: ->(val) { (2010..2020).include? val.to_i },
    eyr: ->(val) { (2020..2030).include? val.to_i },
    hcl: ->(val) { /^#[a-f0-9]{6}$/.match?(val) },
    ecl: ->(val) { %w[amb blu brn gry grn hzl oth].include? val },
    pid: ->(val) { /^\d{9}$/.match?(val) },
    hgt: ->(val) do
      valid_unit = /\d+(cm|in)$/.match?(val)
      return false unless valid_unit

      unit = val[-2..-1]
      height = val.gsub(unit, "").to_i
      ranges = { in: 59..76, cm: 150..193 }
      ranges[unit.to_sym].include?(height)
    end
  }

  def initialize(passport, allow_missing: %i[], validators: VALIDATORS)
    @passport = passport
    @allow_missing = allow_missing
    @validators = validators
  end

  def valid?
    (REQUIRED_FIELDS - @allow_missing).all? do |field|
      @passport.keys.include?(field) && valid_field?(field)
    end
  end

  private

  def valid_field?(field)
    @validators.fetch(field, DEFAULT_VALIDATOR).call(@passport[field])
  end
end
