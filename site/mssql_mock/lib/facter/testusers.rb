# frozen_string_literal: true
require 'json'
Facter.add(:users) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  setcode do
     JSON.parse(File.read('C:/users/Administrator/work/scb_data/users.txt'))
  end
end

