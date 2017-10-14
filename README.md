# [![SnapLayout](https://github.com/sp71/SnapLayout/blob/master/Assets/snapLayout.png?raw=true)](#)
[![Build Status](https://travis-ci.org/sp71/SnapLayout.svg?branch=master)](https://travis-ci.org/sp71/SnapLayout)
[![CocoaPods](https://img.shields.io/cocoapods/metrics/doc-percent/SnapLayout.svg)](http://cocoadocs.org/docsets/SnapLayout)
[![Coverage Status](https://coveralls.io/repos/github/sp71/SnapLayout/badge.svg)](https://coveralls.io/github/sp71/SnapLayout)
[![Version](https://img.shields.io/cocoapods/v/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/SnapLayout.svg?style=flat)](http://cocoapods.org/pods/SnapLayout)
[![License](https://img.shields.io/cocoapods/l/SnapLayout.svg?style=flat)](https://github.com/sp71/SnapLayout/blob/master/LICENSE)

Concise API for Auto Layout. SnapLayout extends `UIView` and `NSView` to deliver a list of APIs to improve readability while also shortening constraint code. Internally uses AutoLayout to provide the best experience. With SnapLayout, developers can remove boilerplate code but not at the cost of readability.

Imagine applying any or all of the following constraints in one line of code to a view: top, leading, trailing, bottom, width, height, centerX, centerY. Not enough? Start chaining your snap calls to support adjacents snaps. This is all possible with `SnapLayout`.

## Why Use It?
Lets use a real world example. Lets say the following view needs to be added. It has a centerX, centerY, width, and height constraint.
 
![SnapLayout](https://github.com/sp71/SnapLayout/blob/master/Assets/exampleView.png?raw=true)

[Apple](https://developer.apple.com/reference/uikit/nslayoutanchor):

```swift
squareView.translatesAutoresizingMaskIntoConstraints = false
squareView.widthAnchor.constraint(equalToConstant: 50)
squareView.heightAnchor.constraint(equalToConstant: 50)
squareView.centerXAnchor.constraint(equalTo: squareSuperview.centerXAnchor, constant: 0)
squareView.centerYAnchor.constraint(equalTo: squareSuperview.centerYAnchor, constant: 0)
```

SnapLayout:

```swift
squareView.snap(width: 50, height: 50, centerX: 0, centerY: 0)
```
SnapLayout handles `translatesAutoresizingMaskIntoConstraints` and references the superview of `squareView` when applying constraints. Built to be flexible, yet readable.

## Setup
### Requirements
* Xcode
  * Language Support: **Swift** *(3.0)*
  * Fully Compatible With: **Xcode 8.0 and higher**
* iOS
  * Fully Compatible With: **iOS 9.0 and above**
* macOS
  * Fully Compatible With: **macOS 10.11 and above**
* tvOS
  * Fully Compatible With: **tvOS 9.0 and above**

### Installation with [CocoaPods](http://cocoapods.org)

```ruby
pod "SnapLayout"
```

### Installation with [Carthage](https://github.com/Carthage/Carthage)
```
github "sp71/SnapLayout"
```

## Usage

### Overview 

* All methods are prefixed with `snap` for quick Xcode autocomplete.
* Directly uses NSLayoutAnchor under the hood so the API is developer friendly
* Any view using `SnapLayout` will not only have its `translatesAutoresizingMaskIntoConstraints` set to `false`, but also have its constraint activated.
* Snap offers many default parameters including the `view` argument. If a view parameter is not supplied, it is assumed your view will be snapping to its superview.
* Powerful API supporting snapping of adjacent views


### [`Methods`](SnapLayout/Classes/SnapLayout.swift)
```swift
func snap(to view: View? = nil, top: CGFloat? = nil, leading: CGFloat? = nil, bottom: CGFloat? = nil, trailing: CGFloat? = nil, width: CGFloat? = nil, height: CGFloat? = nil, centerX: CGFloat? = nil, centerY: CGFloat? = nil, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snap(to view: View? = nil, config: SnapConfig, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snapWidth(to view: View, multiplier: CGFloat = 1, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snapHeight(to view: View, multiplier: CGFloat = 1, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snap(size: CGSize, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snap(trailingView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snap(leadingView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snap(bottomView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
func snap(topView: View, constant: CGFloat = 0, priority: LayoutPriority = LayoutPriorityRequired, isActive: Bool = true) -> SnapManager
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
                      .snapHeight(to: superview, multiplier: 0.5)
print(snapManager.top?.constant)    # 8.0
print(snapManager.height?.constant) # 0.5
```
Snap calls may also be chained and will continue to return a `SnapManager`.
### Config
A `SnapConfig ` struct is also available where a developer may list all of their constraint constants beforehand and provide this type to the snap method argument.

```swift
let config = SnapConfig(top: 50, leading: 50, trailing: 50, width: 30, centerX: 0)
button.snap(config: config)
```

### Priority
SnapLayout assumes required priority (same default as Apple) unless otherwise specified for those created constraints.

```swift
button1.snap(trailingView: button2, constant: 8, priority: UILayoutPriorityDefaultLow)
```

In the following example, the top, leading, bottom, and trailing constraint all have a priority of required; however, the height constraint has a `UILayoutPriorityDefaultHigh` priority. That's it!

```swift
rectangleView.snap(top: 48, leading: 16, bottom: 16, trailing: 16)
             .snap(height: 40, priority: UILayoutPriorityDefaultHigh)
```

### To Activate or not to Activate
SnapLayout, by default, activates all constraints it creates; however, this can be disabled by passing false to `isActive`.

```swift
button1.snap(trailingView: button2, constant: 8, isActive: false)
```

### Debugging
SnapLayout will also print out errors to log if a `snap` was not properly applied.

```
SnapLayout Error - No constraint was applied for view: <UIView: 0x7fcb8f4031d0; frame = (0 0; 0 0); layer = <CALayer: 0x608000036320>>
```

### Safe Area Layout Guide Support
SnapLayout will apply constraints using `safeAreaLayoutGuide` if the app is running iOS 11; otherwise, it will apply the view's layout anchors directly.

### Example Apps

To run the example project, run `pod try SnapLayout`.

This example project contains not only an `Example-iOS` target, but also an `Example-MacOS` target. This is a great introduction to become more familiar with the library.

## Blogs
- [Medium](https://medium.com/@satindersingh71/snaplayout-5758417ee9a0)

## Author

Satinder Singh, satindersingh71@gmail.com

## License

SnapLayout is available under the MIT license. See the LICENSE file for more info.
