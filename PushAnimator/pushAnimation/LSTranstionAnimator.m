//
//  LSTranstionAnimator.m
//  PushAnimation
//
//  Created by Marshal on 2021/11/22.
//

#import "LSTranstionAnimator.h"

typedef NS_ENUM(NSUInteger, LSTranstionType) {
    LSTranstionTypeNone = 0,
    LSTranstionTypeEnter, //跳转
    LSTranstionTypeOut    //退出
};

@interface LSTranstionAnimator : NSObject<UIViewControllerAnimatedTransitioning>
{
    @package;
    LSTranstionType _transtionType;
    UIViewAnimationOptions _animation;
}

@end

@implementation LSTranstionAnimator

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    switch (_transtionType) {
        case LSTranstionTypeEnter:
            [self enterWithTranstion:transitionContext];
            break;
        case LSTranstionTypeOut:
            [self outWithTranstion:transitionContext];
            break;
        default:
            break;
    }
}

- (void)enterWithTranstion:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    //获取变化前后的控制器
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //用与变换的containerView，也是最底部的view，需要主动添加toVc.view到上面去
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    
    [UIView transitionFromView:fromVc.view toView:toVc.view duration:[self transitionDuration:transitionContext] options:_animation completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    //下面通过截图大法模拟动画,比较适合复杂一些的动画
//    UIView *fromView = [fromVc.view snapshotViewAfterScreenUpdates:YES];
//    UIView *toView = [toVc.view snapshotViewAfterScreenUpdates:YES];
//
//    CGFloat width = fromView.frame.size.width;
//    CGFloat height = fromView.frame.size.height;
//
//    fromView.frame = CGRectMake(0, 0, width, height);
//    toView.frame = CGRectMake(-width, 0, width, height);
//
//    [containerView addSubview:fromView];
//    [containerView addSubview:toView];
//
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        fromView.frame = CGRectMake(width, 0, width, height);
//        toView.frame = CGRectMake(0, 0, width, height);
//    } completion:^(BOOL finished) {
//        [fromView removeFromSuperview];
//        [toView removeFromSuperview];
//        [transitionContext completeTransition:YES];
//    }];
}

- (void)outWithTranstion:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //用与变换的containerView，也是最底部的view，需要主动添加toVc.view到上面去
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    [UIView transitionFromView:fromVc.view toView:toVc.view duration:[self transitionDuration:transitionContext] options:_animation completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end

@interface LSTranstionModelAnimator ()

@property (nonatomic, strong) LSTranstionAnimator *modelTransiton;

@end

@implementation LSTranstionModelAnimator

+ (instancetype)transtionWithAnimation:(UIViewAnimationOptions)animation {
    LSTranstionModelAnimator *trans = [self new];
    if (trans) {
        LSTranstionAnimator *animator = [LSTranstionAnimator new];
        animator->_animation = animation;
        trans.modelTransiton = animator;
    }
    return trans;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    _modelTransiton->_transtionType = LSTranstionTypeEnter;
    return _modelTransiton;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    _modelTransiton->_transtionType = LSTranstionTypeOut;
    return _modelTransiton;
}

@end

@interface LSTranstionNaviAnimator ()

@property (nonatomic, strong) LSTranstionAnimator *modelTransiton;

@property BOOL isDimissing;

@end

@implementation LSTranstionNaviAnimator

+ (instancetype)transtionWithAnimation:(UIViewAnimationOptions)animation {
    LSTranstionNaviAnimator *trans = [self new];
    if (trans) {
        LSTranstionAnimator *animator = [LSTranstionAnimator new];
        animator->_animation = animation;
        trans.modelTransiton = animator;
    }
    return trans;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    _modelTransiton->_transtionType = operation;
    return _modelTransiton;
}

@end
