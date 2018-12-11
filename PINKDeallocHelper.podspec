Pod::Spec.new do |s|
  s.name             = "PINKDeallocHelper"
  s.version          = "1.0.0"
  s.summary          = "It's a helper for observing object dealloc"
  s.homepage         = "https://github.com/ipinka/PINKDeallocHelper"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = "Pinka"
  s.source           = { :git => "https://github.com/ipinka/PINKDeallocHelper.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = "PINKDeallocHelper/Src"
end
