class AddColumnCssClassNameToColors < ActiveRecord::Migration[5.2]
  def change
    add_column :colors, :css_class_name, :string, comment: "CSSクラス名"
  end
end
