# frozen_string_literal: true

Facter.add(:department) do
  # https://puppet.com/docs/puppet/latest/fact_overview.html
  setcode do
    hostname=Facter.value(:hostname)
    dept=hostname.chars.first ?  
         hostname.chars.first.downcase : 
         'unknown'
    case 
    when 'b'
      'banking'
    when 'r'
      'retail'
    else
      dept
    end
  end
end
