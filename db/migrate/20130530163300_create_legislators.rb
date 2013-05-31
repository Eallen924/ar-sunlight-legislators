require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :fax
      t.string :website
      t.string :party
      t.string :gender
      t.date   :birthdate
      t.string :twitter_id
    end
  end
end




      # t.string :first_name
      # t.string :middle_name
      # t.string :last_name
      # t.string :name_suffix
      # t.string :nickname
      # t.string :party
      # t.string :state
      # t.string :district
      # t.date   :birthday
      # t.string :gender
      # t.string :email
      # t.string :phone
