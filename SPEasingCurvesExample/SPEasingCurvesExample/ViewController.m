// ViewController.m
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

#import "ViewController.h"

#import "SPEasingCurves.h"
#import "EasingCurveCollectionViewCell.h"

@implementation ViewController

+ (NSString *)titleForEasingCurve:(SPEasingCurve)easingCurve
{
    static NSDictionary * names = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        names = @{
                  @(SPEasingCurveEaseInSine): @"Ease In Sine",
                  @(SPEasingCurveEaseOutSine): @"Ease Out Sine",
                  @(SPEasingCurveEaseInOutSine): @"Ease In Out Sine",
                  @(SPEasingCurveEaseInQuad): @"Ease In Quad",
                  @(SPEasingCurveEaseOutQuad): @"Ease Out Quad",
                  @(SPEasingCurveEaseInOutQuad): @"Ease In Out Quad",
                  @(SPEasingCurveEaseInCubic): @"Ease In Cubic",
                  @(SPEasingCurveEaseOutCubic): @"Ease Out Cubic",
                  @(SPEasingCurveEaseInOutCubic): @"Ease In Out Cubic",
                  @(SPEasingCurveEaseInQuart): @"Ease In Quart",
                  @(SPEasingCurveEaseOutQuart): @"Ease Out Quart",
                  @(SPEasingCurveEaseInOutQuart): @"Ease In Out Quart",
                  @(SPEasingCurveEaseInQuint): @"Ease In Quint",
                  @(SPEasingCurveEaseOutQuint): @"Ease Out Quint",
                  @(SPEasingCurveEaseInOutQuint): @"Ease In Out Quint",
                  @(SPEasingCurveEaseInExpo): @"Ease In Expo",
                  @(SPEasingCurveEaseOutExpo): @"Ease Out Expo",
                  @(SPEasingCurveEaseInOutExpo): @"Ease In Out Expo",
                  @(SPEasingCurveEaseInCirc): @"Ease In Circ",
                  @(SPEasingCurveEaseOutCirc): @"Ease Out Circ",
                  @(SPEasingCurveEaseInOutCirc): @"Ease In Out Circ",
                  @(SPEasingCurveEaseInBack): @"Ease In Back",
                  @(SPEasingCurveEaseOutBack): @"Ease Out Back",
                  @(SPEasingCurveEaseInOutBack): @"Ease In Out Back",
                  };
    });
    
    return names[@(easingCurve)];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return SPEasingCurveCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    EasingCurveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EasingCurveCollectionViewCell" forIndexPath:indexPath];
    
    [cell setTitle:[ViewController titleForEasingCurve:indexPath.item]];
    [cell playAnimationWithCurve:indexPath.item];

    return cell;
}

@end
