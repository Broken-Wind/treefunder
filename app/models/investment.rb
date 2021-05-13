class Investment < ApplicationRecord
  belongs_to :listing
  belongs_to :investor
end
