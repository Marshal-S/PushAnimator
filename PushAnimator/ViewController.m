//
//  ViewController.m
//  PushAnimator
//
//  Created by Marshal on 2021/10/8.
//

#import "ViewController.h"
#import "UIViewController+LSTranstionAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //这么设置可以左滑退出
}

- (IBAction)push:(id)sender {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = UIColor.greenColor;
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:vc.view.frame];
//    scrollView.contentSize = CGSizeMake(10000, 20000);
//    [vc.view addSubview:scrollView];
    [vc.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
    [self push:vc animation:UIViewAnimationOptionTransitionFlipFromRight];
//    [self present:vc animation:UIViewAnimationOptionTransitionFlipFromRight];
//    [self.navigationController pushViewController:vc animated:YES];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)tap:(UITapGestureRecognizer *)sender {
    sender.view.backgroundColor = [UIColor redColor];
    return;
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = UIColor.yellowColor;
    [vc.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)]];
    [self.navigationController pushViewController:vc animated:YES];
//    [self push:vc animation:UIViewAnimationOptionTransitionFlipFromLeft];
}
@end
