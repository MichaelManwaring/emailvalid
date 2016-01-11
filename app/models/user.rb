class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end

class User < ActiveRecord::Base
	include ActiveModel::Validations
	validates :email, uniqueness: true, length: {in: 6..40}, email: true
	validates :username, uniqueness: true, length: {in: 4..30}
	validates :password, length: {in: 4..30}
	validates :key, uniqueness: true
end
