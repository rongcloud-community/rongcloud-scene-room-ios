
Pod::Spec.new do |s|
  
  # 1 - Info
  s.name             = 'RCSceneRoom'
  s.version          = '0.0.2.3'
  s.summary          = 'Scene Room'
  s.description      = "Scene Room module"
  s.homepage         = 'https://github.com/rongcloud'
  s.license      = { :type => "Copyright", :text => "Copyright 2022 RongCloud" }
  s.author           = { 'shaoshuai' => 'shaoshuai@rongcloud.cn' }
  s.source           = { :git => 'https://github.com/rongcloud-community/rongcloud-scene-room-ios.git', :tag => s.version.to_s }
  
  # 2 - Version
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  
  # 3 - config
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'VALID_ARCHS' => 'arm64 x86_64',
  }
  
  # 4 - source
  s.source_files = 'RCSceneRoom/Classes/**/*'
  
  # 5 - resource
  s.resource_bundles = {
    'RCSceneRoom' => ['RCSceneRoom/Assets/*.xcassets']
  }
  
  # 6 - dependency
  s.dependency 'RCSceneService', '>= 0.0.2'
  s.dependency 'RCSceneMessage'
  s.dependency 'RCSceneChatroomKit'
  
  # recommend version >= 5.1.8
  s.dependency 'RongCloudIM/IMKit'
  
  s.dependency 'SnapKit'
  s.dependency 'Reusable'
  s.dependency 'Kingfisher'
  s.dependency 'SVProgressHUD'
  
end
