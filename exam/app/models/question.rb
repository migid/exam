class Question < ActiveRecord::Base
  belongs_to :difficulty

  def knowledges=(value)
    self.knowledges_id=value.join(",")
  end

  def knowledges
    self.knowledges_id.split(",") if self.knowledges_id
  end
end
