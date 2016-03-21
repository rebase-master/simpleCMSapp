class SectionEdit < ActiveRecord::Base

  belongs_to :editor, :class => "AdminUser",
             :foreign_key => "admin_user_id"
  belongs_to :sections

end
