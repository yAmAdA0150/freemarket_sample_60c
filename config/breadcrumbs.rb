
# 親
crumb :root do
  link "メルカリ", root_path
end

# 子
crumb :category do 
  link "カテゴリ一ー覧",categories_path
  parent :root
end

crumb :item  do 
  @item=Item.find(params[:id])
  link @item.name,items_path
  parent :root
end
# カテゴリー

crumb :category_parent do 
@category = Category.find(params[:id])
      link @category.root.genre, category_path(@category.root)
      parent :category
end

crumb  :category_child do
  @category = Category.find(params[:id])
  if @category.children?
  link @category.genre, category_path(@category)
  else
    link @category.parent.genre, category_path(@category.parent)
  end
  parent :category_parent
end

crumb  :category_gchild do
  @category = Category.find(params[:id])
  link @category.genre, category_path(@category)
  parent :category_child
end

# カテゴリーおわり

# マイページ
crumb :user do |user|
  @user=current_user
  link "マイページ", user_path(@user)
  parent :root
end

# マイページの子供

crumb :profile do
  link "プロフィール",edit_user_path
  parent :user
end  

crumb :card do 
  link "支払い方法", new_user_cards_path
  parent :user
end

crumb :address do
  link "本人情報の登録",address_user_path
  parent :user
end

crumb :signout do
  link "ログアウト",signout_user_path
  parent :user
end

# マイページ(支払い方法)孫
crumb :credit do 
  link "クレジットカード登録情報", user_cards_path
  parent :card
end
# マイページおわり