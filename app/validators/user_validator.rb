class UserValidator < ActiveModel::Validator
  def validate(record)
    if User.find_by_id(record.user_id).blank?
      record.errors[:base] << "Cet utilisateur n'existe pas"
    end
  end
end
