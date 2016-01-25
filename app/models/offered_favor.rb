class OfferedFavor < Favor
  has_many :acceptances, foreign_key: 'favor_id'
end