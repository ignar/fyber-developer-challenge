class Offer
  include ActiveModel::Model

  attr_accessor(:link,
                :title,
                :offer_id,
                :teaser,
                :required_actions,
                :thumbnail,
                :offer_types,
                :payout,
                :time_to_payout,
                :store_id)
end
