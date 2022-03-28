# frozen_string_literal: true

Facter.add(:users) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  setcode do
'{
  "users" : {
    "kiosk_test": {
        "comment"   : "comment1",
        "user_type" : "usertype1"
    },
   "sqladmin2" : {
        "comment" : "comment2",
        "user_type" : "usertype2"
   }
  }
}'  
  end
end

