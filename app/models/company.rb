class Company < ApplicationRecord
    validates_presence_of :name, :corporate_name, :cnpj, :address, :domain
    validates_uniqueness_of :cnpj, :domain
    validates :cnpj, format: { with: /[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}\/?[0-9]{4}\-?[0-9]{2}/, message: 'formato aceito: **.***.***/****-**'}
    validates :cnpj, length: { is: 18 }
    has_many :users, dependent: :destroy
end
