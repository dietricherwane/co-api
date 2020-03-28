class ProfileValidator < ActiveModel::Validator
  def validate(record)
    if Profile.find_by_id(record.profile_id).blank?
      record.errors[:base] << "Ce profil utilisateur n'existe pas"
    end
  end
end
