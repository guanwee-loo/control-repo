# frozen_string_literal: true
requires 'json'
Facter.add(:users) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  setcode do
     JSON.parse(File.read('c:/tmp/users.txt'))
  end
end

