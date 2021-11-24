//
//  UIViewController+LSTranstionAnimation.h
//  PushAnimation
//
//  Created by Marshal on 2021/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LSTranstionAnimation)

//present
- (void)present:(UIViewController *)toVc animation:(UIViewAnimationOptions)animation;
//dismiss
- (void)dismissWithAnimation:(UIViewAnimationOptions)animation;

//push
- (void)push:(UIViewController *)toVc animation:(UIViewAnimationOptions)animation;
//返回一次
- (void)popWithAnimation:(UIViewAnimationOptions)animation;
//返回到前面的指定控制器
- (void)popToViewController:(UIViewController *)toVc animation:(UIViewAnimationOptions)animation;
//返回到跟控制器
- (void)popToRootWithAnimation:(UIViewAnimationOptions)animation;

@end

NS_ASSUME_NONNULL_END
