// SPEasingCurves.m
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Sergio Padrino
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "SPEasingCurves.h"

@implementation SPEasingCurves

+ (CAMediaTimingFunction *)timingFunctionForEasingCurve:(SPEasingCurve)easingCurve
{
    static NSDictionary * timingFunctions = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timingFunctions = @{
                            @(SPEasingCurveEaseInSine): [CAMediaTimingFunction functionWithControlPoints:0.47 :0 :0.745 :0.715],
                            @(SPEasingCurveEaseOutSine): [CAMediaTimingFunction functionWithControlPoints:0.39 :0.575 :0.565 :1],
                            @(SPEasingCurveEaseInOutSine): [CAMediaTimingFunction functionWithControlPoints:0.445 :0.05 :0.55 :0.95],
                            @(SPEasingCurveEaseInQuad): [CAMediaTimingFunction functionWithControlPoints:0.55 :0.085 :0.68 :0.53],
                            @(SPEasingCurveEaseOutQuad): [CAMediaTimingFunction functionWithControlPoints:0.25 :0.46 :0.45 :0.94],
                            @(SPEasingCurveEaseInOutQuad): [CAMediaTimingFunction functionWithControlPoints:0.455 :0.03 :0.515 :0.955],
                            @(SPEasingCurveEaseInCubic): [CAMediaTimingFunction functionWithControlPoints:0.55 :0.055 :0.675 :0.19],
                            @(SPEasingCurveEaseOutCubic): [CAMediaTimingFunction functionWithControlPoints:0.215 :0.61 :0.355 :1],
                            @(SPEasingCurveEaseInOutCubic): [CAMediaTimingFunction functionWithControlPoints:0.645 :0.045 :0.355 :1],
                            @(SPEasingCurveEaseInQuart): [CAMediaTimingFunction functionWithControlPoints:0.895 :0.03 :0.685 :0.22],
                            @(SPEasingCurveEaseOutQuart): [CAMediaTimingFunction functionWithControlPoints:0.165 :0.84 :0.44 :1],
                            @(SPEasingCurveEaseInOutQuart): [CAMediaTimingFunction functionWithControlPoints:0.77 :0 :0.175 :1],
                            @(SPEasingCurveEaseInQuint): [CAMediaTimingFunction functionWithControlPoints:0.755 :0.05 :0.855 :0.06],
                            @(SPEasingCurveEaseOutQuint): [CAMediaTimingFunction functionWithControlPoints:0.23 :1 :0.32 :1],
                            @(SPEasingCurveEaseInOutQuint): [CAMediaTimingFunction functionWithControlPoints:0.86 :0 :0.07 :1],
                            @(SPEasingCurveEaseInExpo): [CAMediaTimingFunction functionWithControlPoints:0.95 :0.05 :0.795 :0.035],
                            @(SPEasingCurveEaseOutExpo): [CAMediaTimingFunction functionWithControlPoints:0.19 :1 :0.22 :1],
                            @(SPEasingCurveEaseInOutExpo): [CAMediaTimingFunction functionWithControlPoints:1 :0 :0 :1],
                            @(SPEasingCurveEaseInCirc): [CAMediaTimingFunction functionWithControlPoints:0.6 :0.04 :0.98 :0.335],
                            @(SPEasingCurveEaseOutCirc): [CAMediaTimingFunction functionWithControlPoints:0.075 :0.82 :0.165 :1],
                            @(SPEasingCurveEaseInOutCirc): [CAMediaTimingFunction functionWithControlPoints:0.785 :0.135 :0.15 :0.86],
                            @(SPEasingCurveEaseInBack): [CAMediaTimingFunction functionWithControlPoints:0.6 :-0.28 :0.735 :0.045],
                            @(SPEasingCurveEaseOutBack): [CAMediaTimingFunction functionWithControlPoints:0.175 :0.885 :0.32 :1.275],
                            @(SPEasingCurveEaseInOutBack): [CAMediaTimingFunction functionWithControlPoints:0.68 :-0.55 :0.265 :1.55],
                            };
    });
    
    return timingFunctions[@(easingCurve)];
}

@end
