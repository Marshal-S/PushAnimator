//
//  UIViewController+LSTranstionAnimation.m
//  PushAnimation
//
//  Created by Marshal on 2021/11/22.
//

#import "UIViewController+LSTranstionAnimation.h"
#import <objc/runtime.h>
#import "LSTranstionAnimator.h"

@interface UIViewController (LSTranstionAnimation)

@property (nonatomic, strong) id animatorModel;

@end

@implementation UIViewController (LSTranstionAnimation)

- (void)setAnimatorModel:(id)animatorModel {
    objc_setAssociatedObject(self, "animatorModel", animatorModel, OBJC_ASSOCIATION_RETAIN);
}

- (id)animatorModel {
    return objc_getAssociatedObject(self, "animatorModel");
}

- (void)present:(UIViewController *)toVc animation:(UIViewAnimationOptions)animation {
    self.animatorModel = [LSTranstionModelAnimator transtionWithAnimation:animation];
    toVc.modalPresentationStyle = UIModalPresentationCustom;
    toVc.transitioningDelegate = self.animatorModel;
    [self presentViewController:toVc animated:YES completion:nil];
}

- (void)dismissWithAnimation:(UIViewAnimationOptions)animation {
    self.animatorModel = [LSTranstionModelAnimator transtionWithAnimation:animation];
    self.transitioningDelegate = self.animatorModel;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)push:(UIViewController *)toVc animation:(UIViewAnimationOptions)animation {
    self.animatorModel = [LSTranstionNaviAnimator transtionWithAnimation:animation];
    self.navigationController.delegate = self.animatorModel;
    [self.navigationController pushViewController:toVc animated:YES];
}

- (void)popWithAnimation:(UIViewAnimationOptions)animation {
    self.animatorModel = [LSTranstionNaviAnimator transtionWithAnimation:animation];
    self.navigationController.delegate = self.animatorModel;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToViewController:(UIViewController *)toVc animation:(UIViewAnimationOptions)animation {
    self.animatorModel = [LSTranstionNaviAnimator transtionWithAnimation:animation];
    self.navigationController.delegate = self.animatorModel;
    [self.navigationController popToViewController:toVc animated:YES];
}

- (void)popToRootWithAnimation:(UIViewAnimationOptions)animation {
    self.animatorModel = [LSTranstionNaviAnimator transtionWithAnimation:animation];
    self.navigationController.delegate = self.animatorModel;
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
