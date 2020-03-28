class User < ApplicationRecord
  # Relations
  belongs_to :profile
  has_many :requests

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :firstname => "Prénom",
    :lastname => "Nom",
    :phone => "Numéro de téléphone",
    :email => "Email",
    :password => "Mot de passe",
    :active => "Statut",
    :profile_id => "Profil",
    :terms => "Termes",
    :is_admin => "Est administrateur",
    :created_uid => "Auteur de la création",
    :updated_uid => "Auteur de la modification"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :firstname, :lastname, :phone, :password, :profile_id, :created_uid, :updated_uid, :active, :terms, :is_admin, presence: { message: "doit être renseigné" }
  validates :is_admin, :active, :terms, inclusion: { in: [1, 0], message: "doit être compris entre 0 et 1" }
  validates :phone, numericality: {message: "doit être numérique"}, uniqueness: {message: "existe déjà"}, length: { minimum: 8, message: "doit avoir au moins 8 chiffres" }
  validates :email, uniqueness: {message: "existe déjà"}, presence: {message: "doit être renseigné"}, format: {with: /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i, multiline: true, allow_blank: false, message: "n'est pas valide"}
  validates_with ProfileValidator
end
