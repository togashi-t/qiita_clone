# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :articles, dependent: :destroy
  has_many :article_comments, dependent: :destroy
  has_many :article_likes, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # gem deviseにおいて定義されているemailのformat @@email_regexp = /\A[^@\s]+@[^@\s]+\z/
end
