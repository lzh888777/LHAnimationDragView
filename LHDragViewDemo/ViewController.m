//
//  ViewController.m
//  LHDragViewDemo
//
//  Created by liuzhihua on 2018/11/19.
//  Copyright © 2018 TouchPal. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LHExtension.h"

@interface ViewController ()

@property (nonatomic,weak) UIViewController *containerVc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)centerToLeftRight:(id)sender {
    UIViewController *vc = [self getContainerVC];
    UIView *testView = [self getDragViewWithSize:CGSizeMake(100, 320)];
    [vc.view addSubview:testView];
    CGFloat topSpace = 0;
    CGFloat leftSpace = 0.5 * (self.view.bounds.size.width - testView.bounds.size.width);
    CGFloat rightSpace = leftSpace;
    CGFloat bottomSpace = 0;
    [testView lh_dragWithBoundsInset:UIEdgeInsetsMake(topSpace, leftSpace, bottomSpace, rightSpace) beginDragBlock:nil moveBlock:nil endDragBlock:^(BOOL finishDrag, NSTimeInterval timeinterval) {
        if (finishDrag) {
            [UIView animateWithDuration:1.0 animations:^{
                testView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [testView removeFromSuperview];
            }];
        }
    }];
    
    LHViewOutDirection d = LHViewOutDirectionLeft| LHViewOutDirectionRight;
    [testView lh_setOutDirection:d backToOriginMoveInset:UIEdgeInsetsMake(topSpace, testView.bounds.size.width, topSpace,testView.bounds.size.width)];
    [testView lh_setDismissDuration:1.0];
    //    [testView lh_setDragViewUpMoveDisable:YES];
    //    [testView lh_setDragOutInset:UIEdgeInsetsMake(40, 0, 40, 0)];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)centerToTopBottom:(id)sender {
    UIViewController *vc = [self getContainerVC];
    UIView *testView = [self getDragViewWithSize:CGSizeMake(self.view.bounds.size.width - 30, 160)];
    [vc.view addSubview:testView];
    CGFloat topSpace = 0.5 * (self.view.bounds.size.height - testView.bounds.size.height);
    CGFloat leftSpace = 0;
    CGFloat rightSpace = 0;
    CGFloat bottomSpace = topSpace;
    [testView lh_dragWithBoundsInset:UIEdgeInsetsMake(topSpace, leftSpace, bottomSpace, rightSpace) beginDragBlock:nil moveBlock:nil endDragBlock:^(BOOL finishDrag, NSTimeInterval timeinterval) {
        if (finishDrag) {
            [UIView animateWithDuration:1.0 animations:^{
                testView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [testView removeFromSuperview];
            }];
        }
    }];
    
    LHViewOutDirection d = LHViewOutDirectionTop | LHViewOutDirectionBottom;
    [testView lh_setOutDirection:d backToOriginMoveInset:UIEdgeInsetsMake(testView.bounds.size.height, leftSpace, testView.bounds.size.height, rightSpace)];
    [testView lh_setDismissDuration:1.0];
//    [testView lh_setDragViewUpMoveDisable:YES];
//    [testView lh_setDragOutInset:UIEdgeInsetsMake(40, 0, 40, 0)];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)bottomToBottom:(id)sender {
    UIViewController *vc = [self getContainerVC];
    UIView *testView = [self getDragViewWithSize:CGSizeMake(self.view.bounds.size.width - 30, 100)];
    testView.center = CGPointMake(self.view.center.x, self.view.bounds.size.height - testView.bounds.size.height * 0.5 - 40);
    [vc.view addSubview:testView];
    CGFloat topSpace = 30;
    CGFloat leftSpace = 0;
    CGFloat rightSpace = 0;
    CGFloat bottomSpace = self.view.bounds.size.height - CGRectGetMaxY(testView.frame)+testView.bounds.size.height;
    [testView lh_dragWithBoundsInset:UIEdgeInsetsMake(topSpace, leftSpace, bottomSpace, rightSpace) beginDragBlock:nil moveBlock:nil endDragBlock:^(BOOL finishDrag, NSTimeInterval timeinterval) {
        if (finishDrag) {
            [UIView animateWithDuration:1.0 animations:^{
                testView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [testView removeFromSuperview];
            }];
        }
    }];
    
    LHViewOutDirection d = LHViewOutDirectionBottom;
    [testView lh_setOutDirection:d backToOriginMoveInset:UIEdgeInsetsMake(topSpace, leftSpace, testView.bounds.size.height * 0.5, rightSpace)];
    [testView lh_setDismissDuration:1.0];
    //    [testView lh_setDragViewUpMoveDisable:YES];
    //    [testView lh_setDragOutInset:UIEdgeInsetsMake(40, 0, 40, 0)];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)topToTop:(id)sender {
    UIViewController *vc = [self getContainerVC];
    UIView *testView = [self getDragViewWithSize:CGSizeMake(self.view.bounds.size.width - 30, 100)];
    testView.center = CGPointMake(self.view.center.x, testView.bounds.size.height * 0.5 + 40);
    [vc.view addSubview:testView];
    CGFloat topSpace = testView.frame.origin.y + testView.bounds.size.height;
    CGFloat leftSpace = 0;
    CGFloat rightSpace = 0;
    CGFloat bottomSpace = 30;
    [testView lh_dragWithBoundsInset:UIEdgeInsetsMake(topSpace, leftSpace, bottomSpace, rightSpace) beginDragBlock:nil moveBlock:nil endDragBlock:^(BOOL finishDrag, NSTimeInterval timeinterval) {
        if (finishDrag) {
            [UIView animateWithDuration:1.0 animations:^{
                testView.alpha = 0.0;
            } completion:^(BOOL finished) {
                [testView removeFromSuperview];
            }];
        }
    }];
    
    LHViewOutDirection d = LHViewOutDirectionTop;
    [testView lh_setOutDirection:d backToOriginMoveInset:UIEdgeInsetsMake(testView.bounds.size.height * 0.5, leftSpace, bottomSpace, rightSpace)];
    [testView lh_setDismissDuration:1.0];
    //    [testView lh_setDragViewUpMoveDisable:YES];
    //    [testView lh_setDragOutInset:UIEdgeInsetsMake(40, 0, 40, 0)];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)allDirection:(id)sender {
    UIViewController *vc = [self getContainerVC];
    UIView *testView = [self getDragViewWithSize:CGSizeMake(100, 100)];
    [vc.view addSubview:testView];
    CGFloat topSpace = self.view.bounds.size.height * 0.5 - 0.5 * testView.bounds.size.height;
    CGFloat leftSpace = self.view.bounds.size.width * 0.5 - 0.5 * testView.bounds.size.width;
    CGFloat rightSpace = leftSpace;
    CGFloat bottomSpace = topSpace;
    [testView lh_dragWithBoundsInset:UIEdgeInsetsMake(topSpace, leftSpace, bottomSpace, rightSpace) beginDragBlock:nil moveBlock:nil endDragBlock:^(BOOL finishDrag, NSTimeInterval timeinterval) {
//        if (finishDrag) {
//            [UIView animateWithDuration:1.0 animations:^{
//                testView.alpha = 0.0;
//            } completion:^(BOOL finished) {
//                [testView removeFromSuperview];
//            }];
//        }
    }];
    
    LHViewOutDirection d = LHViewOutDirectionTop | LHViewOutDirectionBottom |
                        LHViewOutDirectionLeft | LHViewOutDirectionRight;
    [testView lh_setOutDirection:d backToOriginMoveInset:UIEdgeInsetsMake(testView.bounds.size.height, testView.bounds.size.width - 30, testView.bounds.size.height, testView.bounds.size.width - 30)];
    [testView lh_setDismissDuration:1.0];
    //    [testView lh_setDragViewUpMoveDisable:YES];
    [testView lh_setDragOutFrameInset:UIEdgeInsetsMake((self.view.bounds.size.height - testView.bounds.size.height) * 0.5 - 10, (self.view.bounds.size.width - testView.bounds.size.width) * 0.5 - 10, (self.view.bounds.size.height - testView.bounds.size.height) * 0.5 - 10, (self.view.bounds.size.width - testView.bounds.size.width) * 0.5 - 10)];
    [self presentViewController:vc animated:YES completion:nil];
}

- (UIViewController *)getContainerVC{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"back" forState:UIControlStateNormal];
    btn.frame = CGRectMake(10, 50, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [vc.view addSubview:btn];
    self.containerVc = vc;
    return vc;
}

- (UIView *)getDragViewWithSize:(CGSize)size{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor orangeColor];
    view.frame = CGRectMake(0, 0, size.width, size.height);
    view.center = self.view.center;
    return view;
}

- (void)dismiss{
    [self.containerVc dismissViewControllerAnimated:YES completion:nil];
}



@end
