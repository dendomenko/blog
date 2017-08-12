class CreatePostTags < ActiveRecord::Migration[5.1]
  def change
    create_table :post_tags do |t|
      t.belongs_to :tag
      t.belongs_to :post
      t.timestamps
    end
  end
end
