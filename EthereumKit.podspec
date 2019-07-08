#
#  Be sure to run `pod spec lint EthereumKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "EthereumKit"
  spec.version      = "2.0.1"
  spec.summary      = "EthereumKit is a free, open-source Swift framework for easily interacting with the Ethereum."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
  EthereumKit is a Swift framework that enables you to create Ethereum wallet and use it in your app.
                   DESC

  spec.homepage     = "https://github.com/D-Technologies/EthereumKit"


  spec.license      = { :type => 'Apache License', :file => 'LICENSE' }


  spec.author             = { "Ryo Fukuda" => " yuzushioh@gmail.com" }


  spec.platform     = :ios, "9.0"
  spec.static_framework = true

  spec.source       = { :git => "https://github.com/D-Technologies/EthereumKit.git", :tag => "#{spec.version}" }
  spec.swift_version = '4.2'


  spec.source_files  = "EthereumKit/**/*.{swift}", "EthereumKit/**/*.{h,m}"
  spec.public_header_files = "EthereumKit/EthereumKit.h"


  spec.dependency "CryptoEthereumSwift",  "~> 2.0.0"

end
