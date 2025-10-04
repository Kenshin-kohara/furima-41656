class Rack::Attack
  # 許可するIP
  safelist('allow from specific IPs') do |req|
    ['192.168.1.157'].include?(req.ip)
  end

  # デフォルトは全て禁止
  blocklist('block all others') do |req|
    true
  end
end