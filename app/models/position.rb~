class Position < ActiveRecord::Base
  attr_accessible :title
  belongs_to :user
    def self.all_titles
      %w(Paid_Driver Board_Member Daytime_Transfer_Crew Driver Driver_SEVAC EMT EMT_SEVAC MEDIC_SEVAC Medic S/O Stand_Bys Driver_Stand_by Training_Class)
    end
end
