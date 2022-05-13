ActiveAdmin.register Training do

    permit_params :training_name,:study_level,:overview,:training_description,:training_duration,:total_tuition,:display_on_home,:created_by,:last_updated_by,:photo, training_lists_attributes: [:id,:title]
  
    index do
      selectable_column
      column :training_name
      column :study_level
      column "duration",:training_duration
      number_column "Tuition",:total_tuition, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2 
      column "Created At", sortable: true do |c|
        c.created_at.strftime("%b %d, %Y")
      end
      actions
    end
  
    filter :training_name
    filter :study_level, as: :select, :collection => ["Training"]
    filter :training_duration, as: :select, :collection => ["1 Month", "2 Month","3 Month","4 Month","5 Month","6 Month","7 Month"]       
    filter :created_by
    filter :last_updated_by
    filter :created_at
    filter :updated_at
  
    scope :recently_added
    scope :undergraduate
    scope :graduate

    form do |f|
      f.semantic_errors
      f.inputs "Training information" do
        f.input :training_name
        f.input :overview,  :as => :ckeditor
        f.input :training_description,  :as => :ckeditor
        f.input :study_level, as: :select, :collection => ["Training"], :include_blank => false        
        f.input :training_duration, as: :select, :collection => ["1 Month", "2 Month","3 Month","4 Month","5 Month","6 Month","7 Month"], :include_blank => false
        f.input :total_tuition
        f.input :display_on_home, as: :boolean
        f.input :photo, as: :file
  
        f.inputs 'Training Includes' do
          f.has_many  :training_lists do |d|
            d.input :title
          end
        end  
        if f.object.new_record?
          f.input :created_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        else
          f.input :last_updated_by, as: :hidden, :input_html => { :value => current_admin_user.name.full}
        end      
      end
      f.actions
    end
  
    show title: :training_name do
      panel "Training information" do
        attributes_table_for training do
          row :training_name
          row :overview
          row :training_description
          row :study_level
          row :training_duration
          number_row :total_tuition, as: :currency, unit: "ETB",  format: "%n %u" ,delimiter: ",", precision: 2 
          row :created_by
          row :last_updated_by
          row :created_at
          row :updated_at
          row :display_on_home
          row "photo" do |pt|
            span image_tag(pt.photo, size: '300x300', class: "img-corner")
          end
        end
      end
  
    end
  end
  