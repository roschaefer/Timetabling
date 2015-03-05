class Curriculum < ActiveRecord::Base
  include HasUnavailabilities
  
  has_many :unavailabilities, dependent: :destroy
  has_many :curriculum_module_assignments
  has_many :ects_modules, through: :curriculum_module_assignments
  
  validates :name, :presence => true

  def self.to_fact
    "curricula(#{count})."
  end

  def available_at!(weekday_id, timeframe_id)
    Curriculum::Unavailability.where(:curriculum => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).destroy_all
  end

  def unavailable_at!(weekday_id, timeframe_id)
    Curriculum::Unavailability.where(:curriculum => self, :weekday_id => weekday_id, :timeframe_id => timeframe_id).first_or_create
  end
  
  def mandatory_modules
   curriculum_module_assignments.where(mandatory:true).collect{|a| a.ects_module }
  end
  
  def selectable_modules
    curriculum_module_assignments.where(mandatory:nil).collect{|a| a.ects_module }
  end
  
  def set_mandatory_flag(module_id,mandatory_flag)
    assignment = self.curriculum_module_assignments.find_by(ects_module_id:module_id)
    
    if assignment and (assignment.mandatory != mandatory_flag)
      assignment.mandatory = mandatory_flag
      assignment.save
    end
  end
    
  def assign_ects_modules(params)
            
      if params and params[:mandatory_modules].is_a?(Array) and params[:selectable_modules].is_a?(Array)
        
        mandatory_module_ids = params[:mandatory_modules].reject{|m_id| m_id.is_a?(String) and m_id.empty? }
        selectable_module_ids = params[:selectable_modules].reject{|m_id| m_id.is_a?(String) and m_id.empty? }
        
        unless (mandatory_module_ids & selectable_module_ids).empty?
          return false
        
        else   
          self.ects_module_ids = (mandatory_module_ids | selectable_module_ids)
          
          mandatory_module_ids.each do |module_id|
            set_mandatory_flag(module_id,true)
          end
          
          selectable_module_ids.each do |module_id|
            set_mandatory_flag(module_id,false)
          end
                    
          return true
        end
      end
      
        return false
  end
  
end
