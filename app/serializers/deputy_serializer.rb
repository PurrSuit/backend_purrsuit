class DeputySerializer < ActiveModel::Serializer

  attributes :id, :name, :gender, :email, :age, :uf_id, :deputy_name,   :registration,:legislation_situation, :image_path, :party_id

end
