class Bug < ApplicationRecord
    belongs_to :user
    enum issue_type: { feature: 0, issue: 1, enhancement: 2 }
    enum priority: { medium: 0, low: 1, high: 2 }
    enum status: { open: 0, closed: 1, monitor: 2 }
    validates :title, :description, :presence => true, allow_blank: false
    validates :status, :inclusion => {:in => statuses.keys}
    validates :issue_type, :inclusion => {:in => issue_types.keys}
    validates :priority, :inclusion => {:in => priorities.keys}

end