class ChangeReviewImageDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :pic, :string, default: "https://www.computerhope.com/jargon/g/guest-user.jpg"
  end
end
