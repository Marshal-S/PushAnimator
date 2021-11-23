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
}

- (IBAction)push:(id)sender {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = UIColor.greenColor;
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:vc.view.frame];
//    scrollView.contentSize = CGSizeMake(10000, 20000);
//    [vc.view addSubview:scrollView];
    [vc.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pop:)]];
    [self push:vc animation:UIViewAnimationOptionTransitionFlipFromRight];
//    [self present:vc animation:UIViewAnimationOptionTransitionFlipFromRight];
    
//    [self.navigationController pushViewController:vc animated:YES];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)pop:(UITapGestureRecognizer *)sender {
    [self popWithAnimation:UIViewAnimationOptionTransitionFlipFromLeft];
//    [self dismissWithAnimation:UIViewAnimationOptionTransitionFlipFromLeft];
}
@end
