# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users do |t|
      ## Database authenticatable
      # Skip columns that already exist
      # t.string :email,              null: false, default: ""
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      unless column_exists?(:users, :reset_password_token)
        t.string   :reset_password_token
        t.datetime :reset_password_sent_at
      end

      ## Rememberable
      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false
      # t.string   :unlock_token
      # t.datetime :locked_at
    end

    # Add indexes only if they don't exist
    unless index_exists?(:users, :reset_password_token)
      add_index :users, :reset_password_token, unique: true
    end
    
    # Other indexes are commented out as they're not being used
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
