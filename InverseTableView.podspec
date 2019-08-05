Pod::Spec.new do |s|
  s.name             = 'InverseTableView'
  s.version          = '0.8.0'
  s.summary          = 'InverseTableView is subclass of UITableView, able to insert like chat.'
  s.description      = <<-DESC
InverseTableView is subclass of UITableView, able to insert like chat. included datasource converter.
                       DESC

  s.homepage         = 'https://github.com/noppefoxwolf/InverseTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tomoya Hirano' => 'cromteria@gmail.com' }
  s.source           = { :git => 'https://github.com/noppefoxwolf/InverseTableView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/noppefoxwolf'

  s.ios.deployment_target = '11.0'
  s.swift_versions = ['5.0']

  s.source_files = 'InverseTableView/Classes/**/*'
end
