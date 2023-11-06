# frozen_string_literal: true

# AddColumnShortMessage
class AddColumnShortMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :furnitures, :short_message, :text, comment: '短い家具内容'
  end
end
