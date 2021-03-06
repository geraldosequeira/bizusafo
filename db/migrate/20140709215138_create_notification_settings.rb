class CreateNotificationSettings < ActiveRecord::Migration
  def change
    create_table :notification_settings do |t|
      t.boolean :new_comment_followed_story, default: true
      t.boolean :new_rating, default: true
      t.boolean :new_comment, default: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
