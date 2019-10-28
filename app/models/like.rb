class Like < ApplicationRecord
  belongs_to :item
  belongs_to :user
  
  ransacker :likes_count do
    query = '(SELECT COUNT(likes.item_id) FROM likes where likes.item_id = items.id GROUP BY likes.item_id)'
    Arel.sql(query)
  end

end
