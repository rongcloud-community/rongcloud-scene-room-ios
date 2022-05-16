
Pod::Spec.new do |s|
  
  # 1 - Info
  s.name             = 'RCSceneRoom'
  s.version          = '0.0.3.2'
  s.summary          = 'Scene Room'
  s.description      = "Scene Room module"
  s.homepage         = 'https://github.com/rongcloud'
  s.license      = { :type => "Copyright", :text => "Copyright 2022 RongCloud" }
  s.author           = { 'shaoshuai' => 'shaoshuai@rongcloud.cn' }
  s.source           = { :git => 'https://github.com/rongcloud-community/rongcloud-scene-room-ios.git', :tag => s.version.to_s }
  
  # 2 - Version
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.static_framework = true
  
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64', 'VALID_ARCHS' => 'arm64 x86_64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  
  # 3 - subspecs
  s.default_subspec = 'RCSceneRoom'
  
  s.subspec 'RCSceneFoundation' do |foundation|
    # 1 - source
    foundation.source_files = 'RCSceneRoom/RCSceneFoundation/**/*.{h,m,swift}'
    
    # 2 - dependency
    foundation.dependency 'SwiftyBeaver'
  end
  
  s.subspec 'RCSceneMessage' do |message|
    # 1 - source
    message.source_files = 'RCSceneRoom/RCSceneMessage/**/*.{h,m,swift}'
    message.public_header_files = 'RCSceneRoom/RCSceneMessage/**/*.{h}'
    
    # 2 - config
    
    # 3 - dependency
    # suggestion version >= 5.1.8
    message.dependency 'RongCloudIM/IMLib'
  end
  
  s.subspec 'RCSceneService' do |service|
    # 1 - source
    service.source_files = 'RCSceneRoom/RCSceneService/**/*.{h,m,swift}'
    
    # 2 - config
    
    # 3 - dependency
    service.dependency 'Moya'
    service.dependency 'ReachabilitySwift'
    service.dependency 'RCSceneRoom/RCSceneFoundation'
  end
  
  s.subspec 'RCSceneGift' do |gift|
    # 1 - source
    gift.source_files = 'RCSceneRoom/RCSceneGift/Classes/**/*'
    
    # 2 - resource
    gift.resource_bundles = {
      'RCSceneGift' => ['RCSceneRoom/RCSceneGift/Assets/*.xcassets']
    }
    
    # 3 - config
    
    # 4 - dependency
    gift.dependency 'RCSceneRoom/RCSceneMessage'
    gift.dependency 'RCSceneRoom/RCSceneService'
    
    gift.dependency 'SnapKit'
    gift.dependency 'Reusable'
    gift.dependency 'Kingfisher'
    gift.dependency 'SVProgressHUD'
    
  end
  
  s.subspec 'RCSceneMusic' do |music|
    # 1 - source
    music.source_files = 'RCSceneRoom/RCSceneMusic/**/*'
    
    # 2 - config
    
    # 3 - dependency
    music.dependency 'RCSceneRoom/RCSceneMessage'
    music.dependency 'RCSceneRoom/RCSceneService'
    
    music.dependency 'SVProgressHUD'
    music.dependency 'RCMusicControlKit'
    music.dependency 'RongCloudRTC/RongRTCLib'
  end
  
  s.subspec 'RCSceneRoomSetting' do |setting|
    # 1 - source
    setting.source_files = 'RCSceneRoom/RCSceneRoomSetting/Classes/**/*'
    
    # 2 - resource
    setting.resource_bundles = {
      'RCSceneRoomSetting' => ['RCSceneRoom/RCSceneRoomSetting/Assets/*.xcassets']
    }
    
    # 3 - config
    
    # 4 - dependency
    setting.dependency 'RCSceneRoom/RCSceneService'
    
    setting.dependency 'SnapKit'
    setting.dependency 'Reusable'
  end
  
  s.subspec 'RCSceneAnalytics' do |analytics|
    # 1 - source
    analytics.source_files = 'RCSceneRoom/RCSceneAnalytics/Classes/**/*'
    
    # 2 - dependency
    analytics.dependency 'RCSceneRoom/RCSceneRoomSetting'
    analytics.dependency 'SensorsAnalyticsSDK'
  end
  
  s.subspec 'RCSceneRoom' do |room|
    # 1 - source
    room.source_files = 'RCSceneRoom/RCSceneRoom/**/*.{h,m,swift}'
    
    # 2 - resource
    room.resource_bundles = {
      'RCSceneRoom' => ['RCSceneRoom/RCSceneRoom/Assets/*.xcassets']
    }
    
    # 3 - config
    
    # 4 - dependency
    room.dependency 'RCSceneRoom/RCSceneMessage'
    room.dependency 'RCSceneRoom/RCSceneService'
    room.dependency 'RCSceneRoom/RCSceneFoundation'
    room.dependency 'RCSceneChatroomKit'
    
    # suggestion version >= 5.1.8
    room.dependency 'RongCloudOpenSource/IMKit'
    
    room.dependency 'SnapKit'
    room.dependency 'Reusable'
    room.dependency 'Kingfisher'
    room.dependency 'SVProgressHUD'
  end
  
end
