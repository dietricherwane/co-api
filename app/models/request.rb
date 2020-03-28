class Request < ApplicationRecord

  # Renaming attributes into more friendly text
  HUMANIZED_ATTRIBUTES = {
    :user_id => "Utilisateur",
    :reference => "Référence",
    :text => "Contenu",
    :status => "Statut",
    :type_request => "Type de requête",
    :created_uid => "Auteur de la création",
    :updated_uid => "Auteur de la modification"
  }

  # Using friendly attribute name if it exists and default name otherwise
  def self.human_attribute_name(attr, option = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # Validations
  validates :reference, :text, :status, :type_request, :user_id, presence: { message: "doit être renseigné"}
  validates :reference, length: { is: 8, message: "doit être sur 8 caractères" }
  validates :status, inclusion: { in: ['progress', 'approved', 'rejected'], message: "doit avoir les valeurs ['progress', 'approved', 'rejected']" }
  validates :type_request, inclusion: { in: ['ACH', 'SAN', 'ASS', 'VOY'], message: "doit avoir les valeurs ['ACH', 'SAN', 'ASS', 'VOY']" }
  validates_with UserValidator
end
