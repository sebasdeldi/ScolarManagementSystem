class User < ActiveRecord::Base
  rolify
  after_create :assign_role
  serialize :debts
  has_many :receipts

  def assign_role
  	if self.username == "admin"
  		self.add_role(:admin) if self.roles.blank?
  	elsif self.role == "student"
      self.add_role(:student) if self.roles.blank?
    elsif self.role == "teacher"
      self.add_role(:teacher) if self.roles.blank?
    end

  end

  # Prepares an attribute that is not represented by a column in
  # the database table, but can still be used in the forms
  attr_accessor :add_debt

  # Performs a callback on save to check if any debts should be added
  # and if there is, it appends to the existing array instead of replacing

  before_save do
    if !self.debts.nil?
      if @add_debt.present?
        self.debts << @add_debt
      end
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

  def self.search_students(search)
    where("names LIKE ? OR last_names LIKE ? OR identification LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").where("role = ?", "student" )
  end

  def self.search_teachers(search)
    where("names LIKE ? OR last_names LIKE ? OR identification LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").where("role = ?", "teacher" )
  end
end
