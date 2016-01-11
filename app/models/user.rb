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

	STATUS = ['imaginary', 'real', 'mystical', 'unreal']

	def status_print
		STATUS[self.status]
	end

	scope :real, -> { where(status: 1)}
	scope :unreal, -> { where(status: 3)}
	scope :imaginary, -> { where(status: 0)}
	scope :mystical, -> { where(status: 2)}
end
