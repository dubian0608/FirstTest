# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/yyqapm/specs.git'
source 'http://git.yy.com/ci_team/Specs.git'

#platform :ios, '8.0'
#
#source 'https://github.com/CocoaPods/Specs.git'
#source 'http://git.yy.com/ci_team/Specs.git'
#source 'https://git.yy.com/opensource/ios_team/Spec.git'

target 'FirstTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  # use_frameworks!

  pod 'AFNetworking',       '~> 3.2.1'
  pod 'thunder',            '2.8.3'

#  pod 'AliPlayerSDK_iOS'
end

#def video_pod()
#  pod 'ffmpeg/ffmpeg-332-ios', '332.500.003' #{@ full @}
#  pod 'libyuv', '1194.5004.0' #{@ full @}
#  pod 'dwx265', '2.0.3' #{@ full @}
#  pod 'ittiamhevc', '0500.6803.0' #{@ full @}
#  pod 'yyvideolib/yyvideolibstatic_nobeauty', '100.5.4' #{@ full @}
#end
#
#def audio_pod()
#  pod 'audioenginesdk', '10.12.8' #{@ full audio @}
#  pod 'argo', '~> 3.1.0' #{@ full audio @}
#  pod 'gslb', '1.0.12' #{@ full audio @}
#  pod 'yyservicesdk/yyservicesdk', '~> 3.3.1' #{@ full audio @}
#  pod 'spidercrab', '~> 1.2.0' #{@ full audio @}
#end
#
#target 'thunderbolt' do
#  pod 'transengine/transengine-full', '2.7.8' #{@ full @}
#  video_pod();
#  audio_pod();
#end
#
#target 'thunder' do
#  pod 'transengine/transengine-audio', '2.7.8' #{@ audio @}
#  audio_pod();
#end
#
#target 'thunderboltdynamic' do
#  pod 'transengine/transengine-full', '2.7.8' #{@ full @}
#  video_pod();
#  audio_pod();
#end
#
#target 'thunderdynamic' do
#  pod 'transengine/transengine-audio', '2.7.8' #{@ audio @}
#  audio_pod();
#end
#
#post_install do |installer|
#  installer.pods_project.targets.each do |target|
#    target.build_configurations.each do |config|
#      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
#      if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 8.0
#         config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
#      end
#    end
#  end
#end
