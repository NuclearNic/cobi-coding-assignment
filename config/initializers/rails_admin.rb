RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

    config.model 'Book' do
      navigation_icon 'fa fa-newspaper-o fa-fw'
    
      # create do
      #   exclude_fields :cover_art_base_64
      # end
      # edit do
      #   exclude_fields :cover_art_base_64
      # end
      # list do
      #   exclude_fields :cover_art_base_64
      # end

      
    
    end
    
    config.model 'Author' do
      navigation_icon 'fa fa-user-circle-o fa-fw'      

    end
    
    config.model 'Genre' do
      navigation_icon 'fa fa-pencil fa-fw'
    end
end
