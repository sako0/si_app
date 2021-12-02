module Resolvers
  class SubjectSearchResolver < Resolvers::BaseResolver
    description '教授名または科目名で絞り込む'
    type [Types::SubjectType], null: false

    argument :subject_title, String, '科目名', required: false
    argument :teacher_name, String, '教授名', required: false

    def resolve(subject_title: nil, teacher_name: nil)
      subjects = nil
      subjects = Subject.where("subjects.title LIKE ?", "%#{subject_title}%") if subject_title.present?
      subjects = Subject.joins(:teacher).where("teachers.name LIKE ?", "%#{teacher_name}%") if teacher_name.present?
      subjects = Subject.all if subjects.nil?
      subjects
    end
  end
end
