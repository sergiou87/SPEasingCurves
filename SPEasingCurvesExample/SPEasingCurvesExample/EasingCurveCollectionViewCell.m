// EasingCurveCollectionViewCell.m
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

#import "EasingCurveCollectionViewCell.h"

@interface EasingCurveCollectionViewCell ()

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIView *animatingView;

@end

@implementation EasingCurveCollectionViewCell

- (void)prepareForReuse
{
    [self.animatingView.layer removeAllAnimations];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.animatingView.layer.cornerRadius = self.animatingView.frame.size.width / 2.f;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.f;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
}

- (CGFloat)initialX
{
    return self.frame.size.width / 10.f;
}

- (CGFloat)finalX
{
    return self.frame.size.width - self.initialX;
}

- (void)playAnimationWithCurve:(SPEasingCurve)easingCurve
{
    [self.animatingView.layer removeAllAnimations];

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    animation.fromValue = @(self.initialX);
    animation.toValue = @(self.finalX);
    animation.duration = 2.f;
    animation.repeatCount = CGFLOAT_MAX;
    animation.timingFunction = [SPEasingCurves timingFunctionForEasingCurve:easingCurve];
    [self.animatingView.layer addAnimation:animation forKey:@"frame"];
    
    self.animatingView.layer.position = CGPointMake(self.finalX, self.animatingView.layer.position.y);
}

@end
