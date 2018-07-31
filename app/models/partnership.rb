class Partnership < ApplicationRecord
  belongs_to :person
  belongs_to :partner, class_name: "Person"
end
