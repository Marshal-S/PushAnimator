//
//  LSNavigationController.m
//  PushAnimator
//
//  Created by Marshal on 2021/11/22.
//

#import "LSNavigationController.h"

@interface LSNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //系统的手势应该是 UIScreenEdgePanGestureRecognizer 类型
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
//    self.navigationItem.titleView = [UIView new]; //定制标题
//    self.navigationItem.rightBarButtonItems //定制导航栏
//    [self setNavigationBarHidden:YES animated:YES]; //隐藏导航栏
//    [self setHidesBottomBarWhenPushed:YES]; //push隐藏tabbar
}

#pragma mark - UIGestureRecognizerDelegate
//这个方法是在手势将要激活前调用：返回YES允许右滑手势的激活，返回NO不允许右滑手势的激活
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        //屏蔽调用rootViewController的滑动返回手势，避免右滑返回手势引起死机问题
        //判断时，判断您当前控制器是否是跟控制器，注意有些符合controller会有多个子controller
        if (self.viewControllers.count < 2 ||
            self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    //这里就是非右滑手势调用的方法啦，统一允许激活
    return YES;
}

@end
