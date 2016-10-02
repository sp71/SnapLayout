# SnapLayout

[![CI Status](http://img.shields.io/travis/Satinder Singh/SnapLayout.svg?style=flat)](https://travis-ci.org/Satinder Singh/SnapLayout)
[![Version](https://img.shields.io/cocoapods/v/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![License](https://img.shields.io/cocoapods/l/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![Platform](https://img.shields.io/cocoapods/p/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)

Concise API for iOS Auto Layout. SnapLayout extends `UIView` to deliver a list of APIs to improve readability while also shortening constraint code. Internally using AutoLayout to provide the best experience. With SnapLayout, developers can pin, anchor, snap, or align views easily!

### Table of Contents
 1. [Setup](#setup)
	* [Requirements](#requirements)
	* [Installation](#installation)
 1. [Usage](#usage)
	* [Sample Code](#sample-code)
	* [Example App](#example-app)

## Setup
### Requirements
SnapLayout's current release supports iOS >= 9.0

* Xcode
  * Language Support: **Swift** *(2.3)*
  * Fully Compatible With: **Xcode 8.0**
  * Minimum Supported Version: **Xcode 8.0**
* iOS
  * Fully Compatible With: **iOS 9.0**
  * Minimum Deployment Target: **iOS 9.0**

### Installation

SnapLayout is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SnapLayout"
```

## Usage
### [`UIView`](SnapLayout/Classes/SnapLayout.swift) extension methods
```swift
func pinToSuperview(edges: UIRectEdge, insets: UIEdgeInsets = UIEdgeInsetsZero) -> [NSLayoutConstraint]
func anchorHeightToSuperview(multiplier multiplier: CGFloat = 0, constant: CGFloat = 0) -> NSLayoutConstraint
func anchorWidthToSuperview(multiplier multiplier: CGFloat, constant: CGFloat = 0) -> NSLayoutConstraint
func anchorSizeToSuperView(size: CGSize) -> [NSLayoutConstraint]
func anchorWidth(constant constant: CGFloat) -> NSLayoutConstraint
func anchorHeight(constant constant: CGFloat) -> NSLayoutConstraint
func anchorSize(size: CGSize) -> [NSLayoutConstraint]
func snapHorizontally(trailingView trailingView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint
func snapHorizontally(leadingView leadingView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint
func snapVertically(bottomView bottomView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint
func snapVertically(topView topView: UIView, constant: CGFloat = 0) -> NSLayoutConstraint
func alignToSuperView(axis: Axis, offset: UIOffset = UIOffsetZero) -> [NSLayoutConstraint]
func align(axis: Axis, toView: UIView, offset: UIOffset = UIOffsetZero) -> [NSLayoutConstraint]
```

### Sample Code

```swift
view.pinToSuperview(.All)
view.pinToSuperview(.Left)
view.pinToSuperview([.Top, .Left, .Right], insets: UIEdgeInsets(top: 16, left: 8, bottom: 0, right: -8))
view.anchorHeightToSuperview()
view.anchorHeightToSuperview(multiplier: 0.5)
view.anchorHeightToSuperview(multiplier: 0.5, constant: 20)
view.anchorWidthToSuperview(constant: 20)
view.anchorSizeToSuperView(size: CGSize(width: 40, height:60))
view.anchorWidth(20)
view.anchorHeight(30)
view.anchorSize(CGSize(width: 20, height:30))
view.snapHorizontally(trailingView: view2)
view.snapHorizontally(trailingView: view2, constant: 8)
view.snapVertically(bottomView: view2, constant: 8)
view.snapVertically(topView: view2)
view.align(.CenterX, toView: view2)
view.align(.CenterXAndY, toView: view2, offset: UIOffset(horizontal: 10, vertical: 5))
view.alignToSuperView(.CenterY)
view.alignToSuperView(.CenterY, offset: UIOffset(horizontal: 0, vertical: 5))
```

### Notes
For conciseness, offset values are only applied to respective edges or aligns provided from first parameter.
For example, since the .Bottom was not provided within the first paramater, the bottom inset value is irrelevant
```swift 
view.pinToSuperview([.Top, .Left, .Right], insets: UIEdgeInsets(top: 16, left: 8, bottom: 0, right: -8))
```

### Example App

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Satinder Singh, satindersingh71@gmail.com

## License

SnapLayout is available under the MIT license. See the LICENSE file for more info.
