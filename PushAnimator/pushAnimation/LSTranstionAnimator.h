//
//  LSTranstionAnimator.h
//  PushAnimation
//
//  Created by Marshal on 2021/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSTranstionModelAnimator : NSObject <UIViewControllerTransitioningDelegate>

/// 动画仅支持UIView的Transition系列
/// @param animation 动画类型
+ (instancetype)transtionWithAnimation:(UIViewAnimationOptions)animation;

@end

@interface LSTranstionNaviAnimator : NSObject <UINavigationControllerDelegate>

@property(nonatomic, strong)  UIViewController *viewController;
/// 动画仅支持UIView的Transition系列
/// @param animation 动画类型
+ (instancetype)transtionWithAnimation:(UIViewAnimationOptions)animation;

@end

NS_ASSUME_NONNULL_END
