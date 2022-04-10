# crumb "ページ名" do
#   link "ビューに表示される名前", "リンクされるURL" //_pathは書かないこと
#   parent :親のページ名（現在の前のページ）
# end

crumb :root do
  link "ホーム", root_path
end

crumb :furnitures_search do
  link "検索", :furnitures
  parent :root
end

crumb :furnitures_show do
  link "家具詳細", :furnitures
  parent :furnitures_search
end

crumb :workshops_index do
  link "工房一覧", :workshops
  parent :root
end

crumb :workshops_show do
  link "工房詳細", :workshops
  parent :workshops_index
end