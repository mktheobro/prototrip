# こっちはFormオブジェクト用のモデル

class TripsPoint
  include ActiveModel::Model
  attr_accessor :trip_date, :trip_title, :trip_comment, :user_id, :address, :point_comment, :image,
                :trip_id, :point_id

  # delegate :persisted?, to: :item

  def initialize(attributes = nil, trip: Trip.new)
      @trip = trip
      attributes ||= default_attributes
      super(attributes)
  end

  # saveはとりあえず簡易的なものを使用
  def save
    # 旅行情報を保存し、変数tripに代入する
    trip = Trip.create(trip_date: trip_date, trip_title: triptitle, trip_comment: tripcomment, user_id: user_id)
    # 旅行先１を保存する
    # donation_idには、変数donationのidと指定すると書いてあるのでtrip_idをとりあえず記述してみたが、そんなカラムは作っていないしおそらく不要
    Point.create(address: address, point_comment: point_comment, trip_id: trip.id)
  end

  # def save
  #    return if invalid?
  #    ActiveRecord::Base.transaction do
  #     tags = split_tag_names.map { |tag_name| Tag.find_or_create_by!(tag_name: tag_name) }
  #     item.update!(name: name, info: info, category_id: category_id, sales_status_id: sales_status_id,
  #     shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id, price: price,user_id: user_id, image: image,tags: tags)
  #    end
  # rescue ActiveRecord::RecordInvalid
  #     false
  # end

  # def to_model
  #   item
  # end

  # private

  # attr_reader :item

  # def default_attributes
  #   {
  #     name: item.name,
  #     info: item.info,
  #     category_id: item.category_id,
  #     sales_status_id: item.sales_status_id,
  #     shipping_fee_status_id: item.shipping_fee_status_id,
  #     prefecture_id: item.prefecture_id,
  #     scheduled_delivery_id: item.scheduled_delivery_id,
  #     price: item.price,
  #     user_id: item.user_id,
  #     image: item.image,
  #     tag_name: item.tags.pluck(:tag_name).join(',')
  #   }
  # end

  # def split_tag_names
  #   tag_name.split(',')
  # end
end
