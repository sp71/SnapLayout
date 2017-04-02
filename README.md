# [![SnapLayout](https://github.com/sp71/SnapLayout/blob/master/Assets/snapLayout.png?raw=true)](#)
[![Build Status](https://travis-ci.org/sp71/SnapLayout.svg?branch=master)](https://travis-ci.org/sp71/SnapLayout)
[![Coverage Status](https://coveralls.io/repos/github/sp71/SnapLayout/badge.svg?branch=master)](https://coveralls.io/github/sp71/SnapLayout?branch=master)
[![Version](https://img.shields.io/cocoapods/v/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![License](https://img.shields.io/cocoapods/l/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![Platform](https://img.shields.io/cocoapods/p/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)

Concise API for iOS Auto Layout. SnapLayout extends `UIView` to deliver a list of APIs to improve readability while also shortening constraint code. Internally uses AutoLayout to provide the best experience. With SnapLayout, developers can remove boilerplate code but not at the cost of readability.

Imagine applying any or all of the following constraints in one line of code to a view: top, leading, trailing, bottom, width, height, centerX, centerY. Not enough? Start chaining your snap calls to support adjacents snaps. This is all possible with `SnapLayout`.

### Table of Contents
 1. [Setup](#setup)
	* [Requirements](#requirements)
	* [Installation](#installation)
 1. [Usage](#usage)
	* [Sample Code](#sample-code)
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

## Usage

### Overview 

* All methods are prefixed with `snap` for quick Xcode autocomplete.
* Directly uses NSLayoutAnchor under the hood so the API is developer friendly
* Any view using `SnapLayout` will not only have its `translatesAutoresizingMaskIntoConstraints` set to `false`, but also have its constraint activated.
* Snap offers many default parameters including the `view` argument. If a view parameter is not supplied, it is assumed your view will be snapping to its superview.
* Powerful API supporting snapping of adjacent views


### [`UIView`](SnapLayout/Classes/SnapLayout.swift) extension methods
```swift
func snap(to view: UIView? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: Bool? = nil, centerY: Bool? = nil) -> ConstraintManager
func snap(to view: UIView? = nil, constants: SnapConfig) -> SnapManager
func snapWidth(to view: UIView? = nil, multiplier: CGFloat = 1) -> SnapManager
func snapHeight(to view: UIView? = nil, multiplier: CGFloat = 1) -> SnapManager
func snapSize(size: CGSize) -> SnapManager
func snap(trailingView: UIView, constant: CGFloat = 0) -> SnapManager
func snap(leadingView: UIView, constant: CGFloat = 0) -> SnapManager
func snap(bottomView: UIView, constant: CGFloat = 0) -> SnapManager
func snap(topView: UIView, constant: CGFloat = 0) -> SnapManager
```

### Sample Code

```swift
let buttonSnapManager = button.snap(top: 50, leading: 50, trailing: 50, width: 30)
buttonSnapManager.top?.constant = 100
```
Not only has this button applied 4 constraints to its superview, but each individual constraint is accessible through the returned `SnapManager` type. The beauty of SnapLayout is not only its powerful API interface, but how easy it is to adjust constraints. Other API's simply return an array, but not SnapLayout. Each constraint is neatly packaged into a `SnapManager`.

### Snapping Adjacent Views
```swift
button1.snap(trailingView: button2, constant: 8)
```
These buttons are now side by side where button2 is now the trailingView. No longer will developers have to think which trailing constraint should apply to which leading constraint. This keeps the code lean and clean.

### Chaining
```swift
let snapManager = view.snap(top: 8, leading: 8, width: 50)
                      .snapHeight(multiplier: 0.5)
print(snapManager.top?.constant)    # 8.0
print(snapManager.height?.constant) # 0.5
```
Snap calls may also be chained and will continue to return a `SnapManager`.

### Constants
A `SnapConfig ` struct is also available where a developer may list all of their constraint constants beforehand and provide this type to the snap method argument.

```swift
let buttonSnapConfig = SnapConfig(top: 50, leading: 50, trailing: 50, width: 30, centerX: true)
let buttonSnapConfig = button.snap(constants: buttonConstraintConstants)
```

### Debugging
SnapLayout will also print out errors to log if a `snap` was not properly applied. For example, if a view is trying to apply a constraint to its superview but was never added as a subview, a runtime log will appear in console.

```
SnapLayout Error - No constraint was applied for view: <UIView: 0x7fcb8f4031d0; frame = (0 0; 0 0); layer = <CALayer: 0x608000036320>>
```

### Example App

To run the example project, run `pod try SnapLayout`.

## Author

Satinder Singh, satindersingh71@gmail.com

## License

SnapLayout is available under the MIT license. See the LICENSE file for more info.
