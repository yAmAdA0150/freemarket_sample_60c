
# 親
crumb :root do
  link "メルカリ", root_path
end

# 子
crumb :category do
  link "カテゴリ一覧",categories_path
  parent :root
end

crumb :brand do
  link "ブランド",brand_path
  parent :root
end

# crumb :user do |user|
#   @user=User.find(params[:id])
#   link "マイページ", user_path(@user)
#   parent :root
# end


crumb :cradit do
  link "支払い方法", new_user_card_path
  parent :mypage
end

crumb :adress do
  link "住所", edit_adress_path
  parent :mypage
end


crumb :registration do
  link "本人情報", edit_user_registration_path
  parent :mypage
end


crumb :buy do
  link "購入商品",buy_item_path
  parent :mypage
end

crumb :logout do
  link "ログアウト",logout_user_path
  parent
end

crumb :item do
  link "出品した商品-出品中",new_item_path
  parent :mypage
end


crumb :credit do 
  link "クレジットカード情報入力", creditcard_signup_index_path
  parent :cradit
end
