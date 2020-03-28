class Profile < ApplicationRecord
  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :name => "Nom du profil",
    :description => "Description du profil",
    :created_uid => "Auteur de la création",
    :updated_uid => "Auteur de la modification"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :name, presence: { message: "doit être renseigné"}
  validates :name, uniqueness: {message: "existe déjà"}
end
