Pod::Spec.new do |s|
  s.name     = 'SPEasingCurves'
  s.version  = '1.0'
  s.license  = 'MIT'
  s.summary  = 'Timing functions for easing curves from http://easings.net'
  s.screenshot = 'https://raw.github.com/sergiou87/SPEasingCurves/master/SPEasingCurvesExample/example.gif'
  s.homepage = 'https://github.com/sergiou87/SPEasingCurves'
  s.author   = { "Sergio Padrino" => "sergio.padrino@gmail.com" }
  s.source   = { :git => 'https://github.com/sergiou87/SPEasingCurves.git', :tag => '0.1' }
  s.platform     = :ios, '6.0'
  s.source_files = 'SPEasingCurves'
  s.requires_arc = true
end
