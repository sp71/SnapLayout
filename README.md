# SnapLayout

[![CI Status](http://img.shields.io/travis/Satinder Singh/SnapLayout.svg?style=flat)](https://travis-ci.org/Satinder Singh/SnapLayout)
[![Version](https://img.shields.io/cocoapods/v/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![License](https://img.shields.io/cocoapods/l/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![Platform](https://img.shields.io/cocoapods/p/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)

Concise API for iOS Auto Layout. SnapLayout extends `UIView` to deliver a list of APIs to improve readability while also shortening constraint code. Internally uses AutoLayout to provide the best experience. With SnapLayout, developers can remove boilerplate code but not at the cost of readability.

Imagine applying any or all of the following constraints in one line of code: top, leading, trailing, bottom, width, height, centerX, centerY. This is possible with `SnapLayout`.

### Table of Contents
1. [Setup](#setup)
  * [Requirements](#requirements)
  * [Installation](#installation)
2. [Usage](#usage)
  * [Sample Code](#sample-Code)
  * [Example App](#example-app)

## Setup
### Requirements
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

## Overview
SnapLayout offers many `UIView` extension methods available in the [source files](SnapLayout/SnapLayout/Classes/SnapLayout.swift). 

* All methods are prefixed with `snap` for quick Xcode autocomplete.
* Directly uses NSLayoutAnchor under the hood so the API is developer friendly
* Any view using `SnapLayout` will not only have its `translatesAutoresizingMaskIntoConstraints` set to false, but also have its constraint activated.
* Amazing constraint situations such as snapping a button to the label on top of it is an effortless process now: `button.snapVertically(topView: label, constant: 8)`

## Usage
### [`UIView`](SnapLayout/Classes/SnapLayout.swift) extension methods
```swift
func snap(to view: UIView? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: Bool? = nil, centerY: Bool? = nil)
func snap(to view: UIView? = nil, constants: ConstraintConstants) -> ConstraintManager
func snapWidth(constant: CGFloat) -> ConstraintManager
func snapWidth(to view: UIView? = nil, multiplier: CGFloat = 1) -> ConstraintManager
func snapHeight(constant: CGFloat) -> ConstraintManager
func snapHeight(to view: UIView? = nil, multiplier: CGFloat = 1) -> ConstraintManager
func snapSize(size: CGSize) -> ConstraintManager
func snapHorizontally(trailingView: UIView, constant: CGFloat = 0) -> ConstraintManager
func snapHorizontally(leadingView: UIView, constant: CGFloat = 0) -> ConstraintManager
func snapVertically(bottomView: UIView, constant: CGFloat = 0) -> ConstraintManager
func snapVertically(topView: UIView, constant: CGFloat = 0) -> ConstraintManager
```

### Sample Code

```swift
let buttonConstraintManager = button.snap(top: 50, leading: 50, trailing: 50, width: 30)
buttonConstraintManager.top?.constant = 100
```
Not only has this button applied 4 constraints, but each individual constraint is accessible through the returned `ConstraintManager`. The beauty of SnapLayout is not only its power interface, but how easy it is to adjust returned constraints. Other API's simply return an array, but not SnapLayout. Each constraint is neatly packaged into a `ConstraintManager`.

### Constants
A `ConstraintConstants` struct is also available where a developer may list all of their constraint constants beforehand and provide a `ConstraintConstants ` struct to the snap method argument.

```swift
let buttonConstraintConstants = ConstraintConstants(top: 50, leading: 50, trailing: 50, width: 30)
let buttonConstraintManager = button.snap(constants: buttonConstraintConstants)
buttonConstraintManager.top?.constant = 100
```

### Example App

To run the example project, run `pod try SnapLayout`

## Author

Satinder Singh, satindersingh71@gmail.com

## License

SnapLayout is available under the MIT license. See the LICENSE file for more info.
