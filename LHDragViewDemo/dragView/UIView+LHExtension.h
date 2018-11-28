//
//  UIView+LHExtension.h
//  LHDragViewDemo
//
//  Created by liuzhihua on 2018/11/19.
//  Copyright © 2018 TouchPal. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,LHViewOutDirection){
    LHViewOutDirectionNone = 0,
    LHViewOutDirectionTop = 1 << 0,
    LHViewOutDirectionLeft = 1 << 1,
    LHViewOutDirectionRight = 1 << 2,
    LHViewOutDirectionBottom = 1 << 3,
};

typedef void(^LHDragViewEndDrag)(BOOL finishDrag,NSTimeInterval timeinterval);

typedef void(^LHDragViewMoving)(CGPoint deltaVector);

@interface UIView (LHExtension)

//设置可滑动的距离，以及滑动过程的各个回调
/*
 *  @param inset 以自己为中心，四周可以滑动的距离
 *  @param beginBlock pan手势begin的回调
 *  @param moveBlock pan手势change的回调
 *  @param endBlock pan手势end和cancel的回调
 */
- (void)lh_dragWithBoundsInset:(UIEdgeInsets)inset beginDragBlock:(dispatch_block_t)beginBlock moveBlock:(LHDragViewMoving)moveBlock endDragBlock:(LHDragViewEndDrag)endBlock;

//设置松手后的退出方向，以及滑动到多少才退出的距离
/*
 *  @param direction 动画退出的方向 可以多个方向退出
 *  @param inset 以自己为中心，四周滑动的多少距离松手后触发退出滑动区域的逻辑
 */
- (void)lh_setOutDirection:(LHViewOutDirection)direction backToOriginMoveInset:(UIEdgeInsets)inset;

//设置松手后动画的时间
/*
 *  @param timeInterval 动画回到原位或者退出到边缘的时间，根据view实时的位置算比例的到真实的，默认0.3
 */
- (void)lh_setDismissDuration:(NSTimeInterval)timeInterval;

//设置松手后退出滑动区域的相对最初位置的距离
/*
 *  @param inset 松手触发退出滑动区域的逻辑后，回到的位置离最初位置的距离
 */
- (void)lh_setDragOutFrameInset:(UIEdgeInsets)inset;

//设置是否允许松手后view的滑动，默认是NO
/*
 *  @param disable 禁止松手自动滑动的功能
 */
- (void)lh_setDragViewUpMoveDisable:(BOOL)disable;

@end
