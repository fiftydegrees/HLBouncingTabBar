# HLBouncingTabBar

Lightweight UITabBar subclass which add a bounce effect under tab icons while switching tab. Use UIKitDynamics.

![HLBouncingTabBar sample](https://raw.githubusercontent.com/fiftydegrees/HLBouncingTabBar/master/README-Files/hlbouncingtabbar-sample.gif)

## Installation

### Manually

* Simply drag the `./HLBouncingTabBar` folder into your project.

## Usage

Just subclass your UITabBar to make it a HLBouncingTabBar instance. Then, assign your UITabBarController delegate directly to the UITabBar.

```
tabBarController?.delegate = tabBarController?.tabBar as HLBouncingTabBar
```

**Change cursor color:**

```
tabBar.cursorBackgroundColor = UIColor.whiteColor()
```

## Settings

**Change icons tint color:**

```
tabBar.tintColor = UIColor.yellowColor()
```

## Credits

HLBouncingTabBar was developed by [Hervé Heurtault de Lammerville](http://www.hervedroit.com). If you have any feature suggestion or bug report, please help out by creating [an issue](https://github.com/fiftydegrees/HLBouncingTabBar/issues/new) on GitHub.