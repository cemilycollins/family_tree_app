class Partnership < ApplicationRecord
  belongs_to :partner, class_name: "Person"
end
