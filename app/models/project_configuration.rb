class ProjectConfiguration < ConfigurationParameter
  include LogicallyDeletable

  belongs_to :project

  validates :project,
    :presence => true
  validates :name, 
    :uniqueness => { :scope => :project_id }

  # default templates for Projects
  def self.templates
    {
      'rails'         => Webistrano::Template::Rails,
      'mongrel_rails' => Webistrano::Template::MongrelRails,
      'thin_rails' => Webistrano::Template::ThinRails,   
      'mod_rails' => Webistrano::Template::ModRails,
      'pure_file' => Webistrano::Template::PureFile,
      'pure_php' => Webistrano::Template::PurePHP,
      'unicorn' => Webistrano::Template::Unicorn
    }
  end

end
