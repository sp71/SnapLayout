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
  * Language Support: **Swift** *(3.0)*
  * Fully Compatible With: **Xcode 8.0 and higher**
  * Minimum Supported Version: **Xcode 8.0**
* iOS
  * Fully Compatible With: **iOS 9.0 and above**
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
func pinToSuperview(top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) -> ConstraintManager
func pinToSuperview(_ insets: ConstraintEdgeInsets) -> ConstraintManager
func pin(view: UIView, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil) -> ConstraintManager
func pin(view: UIView, insets: ConstraintEdgeInsets) -> ConstraintManager
func anchorWidth(constant: CGFloat) -> ConstraintManager
func anchorWidth(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> ConstraintManager
func anchorWidthToSuperview(multiplier: CGFloat = 1, constant: CGFloat = 0) -> ConstraintManager
func anchorHeight(constant: CGFloat = 0) -> ConstraintManager
func anchorHeight(view: UIView, multiplier: CGFloat = 1, constant: CGFloat = 0) -> ConstraintManager
func anchorHeightToSuperview(multiplier: CGFloat = 0, constant: CGFloat = 0) -> ConstraintManager
func anchorSizeToSuperView(_ size: CGSize) -> ConstraintManager
func anchorSize(view: UIView) -> ConstraintManager
func anchorSize(size: CGSize) -> ConstraintManager
func snapHorizontally(trailingView: UIView, constant: CGFloat = 0) -> ConstraintManager
func snapHorizontally(leadingView: UIView, constant: CGFloat = 0) -> ConstraintManager
func snapVertically(bottomView: UIView, constant: CGFloat = 0) -> ConstraintManager
func snapVertically(topView: UIView, constant: CGFloat = 0) -> ConstraintManager
func align(_ axis: ConstraintAxis, toView: UIView, offset: UIOffset = .zero) -> ConstraintManager
func alignToSuperView(_ axis: ConstraintAxis, offset: UIOffset = .zero) -> ConstraintManager
```

### Sample Code

```swift
view.pinToSuperview(.zero)
view.pinToSuperview(ConstraintEdgeInsets(top: 50, leading: 8))
view.anchorHeightToSuperview()
view.anchorHeightToSuperview(multiplier: 0.5)
view.anchorHeightToSuperview(multiplier: 0.5, constant: 20)
view.anchorWidthToSuperview(constant: 20)
view.anchorSizeToSuperview(size: CGSize(width: 40, height:60))
view.anchorWidth(20)
view.anchorHeight(30)
view.anchorSize(CGSize(width: 20, height:30))
view.snapHorizontally(trailingView: view2)
view.snapHorizontally(trailingView: view2, constant: 8)
view.snapVertically(bottomView: view2, constant: 8)
view.snapVertically(topView: view2)
view.align(.centerX, toView: view2)
view.align(.centerXAndY, toView: view2, offset: UIOffset(horizontal: 10, vertical: 5))
view.alignToSuperView(.centerY)
view.alignToSuperView(.centerY, offset: UIOffset(horizontal: 0, vertical: 5))
```

### Notes
All of the UIView Extensions return a `ConstraintManager`. This holds all of the applied constraints. Imagine a scenario where a view has a height constraint and pinned to the top, leading, and trailing of super view. Both of these constraints exist within their respective `ConstraintManager`. This manager also has a handy `append` function which combines another constraint manager with itself. In the following example, `loginConstraintManager` holds many initalized properties so a developer can quickly access the `height`, `top`, `leading`, and `trailing` constraints through `loginConstraintManager `.

```swift
let loginConstraintManager = loginButton.anchorHeightToSuperview()
loginConstraintManager.append(loginButton.pinToSuperview(top: 8, leading: 8, trailing: 8))
```

### Example App

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Satinder Singh, satindersingh71@gmail.com

## License

SnapLayout is available under the MIT license. See the LICENSE file for more info.
