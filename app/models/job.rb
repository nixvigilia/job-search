# == Schema Information
#
# Table name: jobs
#
#  id                  :bigint           not null, primary key
#  company_email       :string(255)
#  company_name        :string(255)
#  company_website     :string(255)
#  compensation_range  :string(255)
#  compensation_type   :string(255)
#  estimated_hours     :string(255)
#  featured            :boolean          default(FALSE)
#  featured_until      :datetime
#  headquarters        :string(255)
#  link_to_apply       :string(255)
#  price               :integer
#  published_at        :datetime
#  remote              :boolean          default(FALSE)
#  slug                :string(255)
#  status              :string(255)      default("pending")
#  title               :string(255)
#  upsell_type         :string(255)
#  years_of_experience :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_jobs_on_slug     (slug) UNIQUE
#  index_jobs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  # relations
  belongs_to :user
  has_rich_text :description
  has_rich_text :company_description
  # has_one_attached :company_logo
  has_one_base64_attached :company_logo

  # scopes
  scope :desc, -> { order(created_at: :desc) }
  scope :pending, -> { where(status: JOB_STATUSES[:pending]) }
  scope :published, -> { where(status: JOB_STATUSES[:published]) }
  scope :archived, -> { where(status: JOB_STATUSES[:archived]) }

  BASE_JOB_PRICE = 199
  GOOD_JOB_PRICE = BASE_JOB_PRICE + 49
  BETTER_JOB_PRICE = BASE_JOB_PRICE + 69
  GREAT_JOB_PRICE = BASE_JOB_PRICE + 149

  # pricing
  PRICING = {
    base: BASE_JOB_PRICE,
    good: GOOD_JOB_PRICE,
    better: BETTER_JOB_PRICE,
    great: GREAT_JOB_PRICE
  }

  UPSELL_TYPES = {
    no_thanks: "no-thanks",
    good: "good",
    better: "better",
    great: "great"
  }

  # constants
  COMPENSATION_TYPES = [
    "Contract",
    "Full-time"
  ]

  COMPENSATION_RANGES = [
    "15,000 - 20,000",
    "20,000 - 30,000",
    "30,000 - 40,000",
    "40,000 - 50,000",
    "50,000 - 60,000",
    "60,000 - 70,000",
    "70,000 - 80,000",
    "80,000 - 90,000",
    "90,000 - 100,000",
    "100,000 - 110,000",
    "110,000 - 120,000",
    "120,000 - 130,000",
    "130,000 - 140,000",
    "140,000 - 150,000",
    "150,000 - 160,000",
    "160,000 - 170,000",
    "170,000 - 180,000",
    "180,000 - 190,000",
    "190,000 - 200,000",
    "greater than 200,000"
].freeze

  HOURLY_RANGES = [
    "less than 10",
    "10-30",
    "30-60",
    "60-90",
    "more than 100"
].freeze

  JOB_STATUSES = {
    pending: "pending",
    published: "published",
    archived: "archived"
  }.freeze

  YEARS_OF_EXPERIENCE_RANGE = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "more than 10"].freeze

  def slug_candidates
    [:title, [:title, "#{Job.where(
      title: title, company_name: company_name
    ).count + 1}"]]
  end
  

  def pending?
    self.status == Job::JOB_STATUSES[:pending]
  end

  def published?
    self.status == Job::JOB_STATUSES[:published]
  end

  def archived?
    self.status == Job::JOB_STATUSES[:archived]
  end

  def new_friendly_id?
    if !slug?
      title_changed?
    else
      false
    end
  end

end
