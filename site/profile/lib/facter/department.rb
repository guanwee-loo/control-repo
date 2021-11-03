# frozen_string_literal: true

Facter.add(:department) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  setcode do
    hostname = Facter.value(:hostname)
    dept = hostname[0] ? hostname[0].downcase : 'unknown'
    case dept
    when 'b'
      'banking'
    when 'r'
      'retail'
    else
      dept
    end
  end
end
