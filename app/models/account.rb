class GoodNameValidator < ActiveModel::Validator
  def validate(record)
    digits = ['0','1','2','3','4','5','6','7','8','9']
    undigit_presenese = false
    record.name.each_char do |c|
    	undigit_presenese=true if !digits.include?(c)    	
  	end
    unless undigit_presenese
      record.errors[:name] << "Name can not consist from digits only"
    end
  end
end

class Account < ActiveRecord::Base
	has_one :cart
  belongs_to :user

  validates_with GoodNameValidator
	validates :name, presence: true, length: {in: 8..20}
	validates :age, presence: true, inclusion: {in: 18..100}
end 