require 'minitest/autorun'
require_relative 'passport'
require_relative 'passport_validator'

class PassportValidatorTest < MiniTest::Test
  def test_valid_passport
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal true, valid
  end

  def test_invalid_eye_color
    str = "ecl:xxx pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_invalid_pid
    str = "ecl:amb pid:0123456789 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_invalid_height_unit
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183m"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_double_height_unit
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cmin"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_high_inches
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:77in"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_low_inches
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:58in"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_invalid_length_hair_color
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#1234567 byr:1937 iyr:2017 cid:147 hgt:180cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_invalid_character_hair_color
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#123g56 byr:1937 iyr:2017 cid:147 hgt:180cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_invalid_start_character_hair_color
    str = "ecl:gry pid:860033327 eyr:2020 hcl:a123g56 byr:1937 iyr:2017 cid:147 hgt:180cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_low_centimeters
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:149cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_high_centimeters
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:194cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_low_expiration_year
    str = "ecl:gry pid:860033327 eyr:2019 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_high_expiration_year
    str = "ecl:gry pid:860033327 eyr:2031 hcl:#fffffd byr:1937 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_few_digits_birth_year
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:111 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_low_birth_year
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1919 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_high_birth_year
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:2003 iyr:2017 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_low_issue_year
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2009 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_too_high_issue_year
    str = "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd byr:1937 iyr:2021 cid:147 hgt:183cm"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_invalid_passport
    str = "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884 hcl:#cfa07d byr:1929"
    passport = Passport.new(str)

    valid = PassportValidator.new(passport).valid?

    assert_equal false, valid
  end

  def test_valid_if_excluding_field
    str = "hcl:#ae17e1 iyr:2013\n" +
          "eyr:2020\n" +
          "ecl:brn pid:760753108 byr:1931\n" +
          "hgt:179cm"
    passport = Passport.new(str)
    options = { allow_missing: %i[cid] }

    valid = PassportValidator.new(passport, **options).valid?

    assert_equal true, valid
  end

  def test_invalid_if_excluding_field
    str = "hcl:#cfa07d eyr:2025 pid:166559648\n" +
          "iyr:2011 ecl:brn hgt:59in"
    passport = Passport.new(str)
    options = { allow_missing: %i[cid] }

    valid = PassportValidator.new(passport, **options).valid?

    assert_equal false, valid
  end
end
