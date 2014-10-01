## SPEasingCurves

SPEasingCurves are just some timing functions from [easings.net](http://easings.net) that you can use in your **CoreAnimation** and [**Pop**](http://github.com/facebook/pop) animations.

![SPEasingCurves example](https://raw.github.com/sergiou87/SPEasingCurves/master/SPEasingCurvesExample/example.gif)

If you want to use it with **Pop**, you'll probably need at least **1.0.7** version, which includes [a fix I submitted](https://github.com/facebook/pop/pull/141) for timing functions that exceeds 1.0 that made the animation to stop prematurely.

## Install SPEasingCurves

1. **Using CocoaPods**

  Add SPEasingCurves to your Podfile:

  ```ruby
  platform :ios, "6.0"
  pod 'SPEasingCurves'
  ```

  Run the following command:

  ```
  pod install
  ```

2. **Manually**

  Copy both `SPEasingCurves.h` and `SPEasingCurves.m` files into your project or add this repo as a submodule and then drag the whole SPEasingCurves folder to your project.
  
  Then, you can simply do:

    ```objective-c
    #import "SPEasingCurves.h"
    ```

## Usage of SPEasingCurves

There is an enum with all the available easing curves in `SPEasingCurves.h`:

```objective-c
typedef NS_ENUM(NSInteger, SPEasingCurve) {
    SPEasingCurveEaseInSine,
    SPEasingCurveEaseOutSine,
    SPEasingCurveEaseInOutSine,
    SPEasingCurveEaseInQuad,
    SPEasingCurveEaseOutQuad,
    SPEasingCurveEaseInOutQuad,
    SPEasingCurveEaseInCubic,
    SPEasingCurveEaseOutCubic,
    SPEasingCurveEaseInOutCubic,
    SPEasingCurveEaseInQuart,
    SPEasingCurveEaseOutQuart,
    SPEasingCurveEaseInOutQuart,
    SPEasingCurveEaseInQuint,
    SPEasingCurveEaseOutQuint,
    SPEasingCurveEaseInOutQuint,
    SPEasingCurveEaseInExpo,
    SPEasingCurveEaseOutExpo,
    SPEasingCurveEaseInOutExpo,
    SPEasingCurveEaseInCirc,
    SPEasingCurveEaseOutCirc,
    SPEasingCurveEaseInOutCirc,
    SPEasingCurveEaseInBack,
    SPEasingCurveEaseOutBack,
    SPEasingCurveEaseInOutBack,
    SPEasingCurveCount
};
```

Then you have the class method `timingFunctionForEasingCurve:` of class `SPEasingCurves` that given a value of the previous enum, returns a proper timing function that can be used in an animation.

### With CoreAnimation animations

Just set the proper timing function in your animation:

```objective-c
CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
animation.fromValue = @(0.f);
animation.toValue = @(200.f);
animation.duration = 1.f;
animation.timingFunction = [SPEasingCurves timingFunctionForEasingCurve:SPEasingCurveEaseInOutBack];
[self.animatingView.layer addAnimation:animation forKey:@"myAnimation"];
```

### With Pop animations

It's exactly the same but with `POPAnimation` instances:

```objective-c
POPBasicAnimation *animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
animation.fromValue = @(0.f);
animation.toValue = @(200.f);
animation.duration = 1.f;
animation.timingFunction = [SPEasingCurves timingFunctionForEasingCurve:SPEasingCurveEaseInOutBack];
[self.animatingView pop_addAnimation:animation forKey:@"myAnimation"];
```

## Contact

SPEasingCurves was created by Sergio Padrino: [@sergiou87](https://twitter.com/sergiou87), based on easing curves from  [easings.net](http://easings.net).

## Contributing

If you want to contribute to the project just follow this steps:

1. Fork the repository.
2. Clone your fork to your local machine.
3. Create your feature branch.
4. Commit your changes, push to your fork and submit a pull request.

## License

SPEasingCurves is available under the MIT license. See the [LICENSE file](https://github.com/sergiou87/SPEasingCurves/blob/master/LICENSE) for more info.
