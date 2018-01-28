module Erp::Recruitments
  class RecruitApplication < ApplicationRecord
    belongs_to :recruitment, class_name: "Erp::Recruitments::Recruitment"
    validates :note, :cv_file, :presence => true
  end
end
