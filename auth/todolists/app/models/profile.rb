class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_or_last
  validate :boy_named_sue
  validates :gender, inclusion: {in: %w(male female), message: "%{value} is not a valid option"}

  def first_or_last
    if [first_name, last_name].reject(&:blank?).size == 0
      errors[:base] << ("Please provide at least one name")
    end
  end

  def boy_named_sue
    if gender == "male" && first_name == "Sue"
      errors[:base] << ("Any old name but 'Sue!'")
    end
  end

  def self.get_all_profiles(min, max)
    Profile.born_between(min, max).ordered_by_birth_year
  end

  scope :ordered_by_birth_year, -> {order birth_year: :asc }
  scope :born_between, -> (min,max){where("birth_year BETWEEN ? AND ?", min, max)}
end
