class CreateIssuesAndPullRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title, null: false
      t.string :state, null: false
      t.references :pull_request
    end

    create_table :pull_requests do |t|
      t.timestamp :merged_at
      t.boolean :draft, null: false, default: false
    end
  end
end
