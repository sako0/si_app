class LecturesSerializer < ActiveModel::Serializer
  attributes :id, :title, :date

  def date
    object.date.strftime("%Y-%m-%d")
  end
end
