# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

flutter_app_path = '../test_flutter'
load File.join(flutter_app_path, '.ios', 'Flutter', 'podhelper.rb')

target 'flutter_ios_demo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  install_all_flutter_pods(flutter_app_path)
  # Pods for flutter_ios_demo

  target 'flutter_ios_demoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'flutter_ios_demoUITests' do
    # Pods for testing
  end

end
