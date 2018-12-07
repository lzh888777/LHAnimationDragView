###一.背景
- 一般开发中，经常会遇到给一个view添加pan手势，让它可以跟随手指的移动而移动，每次碰到这样的需求的时候，都是找个相似的功能模块拷贝代码，还得花点时间调试，实在是很不方便，于是写了一个UIView的分类去封装了对应实例的滑动操作，完成效果如下:
  1. 滑动的view在中间，向上下方向滑动一段距离消失
![TopBottomDemo.gif](https://upload-images.jianshu.io/upload_images/1949406-952e859a7c522a86.gif?imageMogr2/auto-orient/strip)

  2. 滑动的view在中间，向左右方向滑动一段距离消失
![leftRightDemo.gif](https://upload-images.jianshu.io/upload_images/1949406-f6e9d530a416f4da.gif?imageMogr2/auto-orient/strip)



  3. 滑动的view在屏幕上边，向上方向滑动一段距离消失
![TopToTop.gif](https://upload-images.jianshu.io/upload_images/1949406-db9eb173fbe8deba.gif?imageMogr2/auto-orient/strip)


  4. 滑动的view在屏幕下边，向下方向滑动一段距离消失
![BottomToBottom.gif](https://upload-images.jianshu.io/upload_images/1949406-67410ec490ae2e2b.gif?imageMogr2/auto-orient/strip)


  5. 滑动的view在屏幕某一位置，向四周滑动一段距离然后靠屏幕边缘停留
![AllDirection.gif](https://upload-images.jianshu.io/upload_images/1949406-3651f47d5f76c678.gif?imageMogr2/auto-orient/strip)


###二. 开发步骤
让一个view可以滑动，分为以下几个步骤；
1.  给view添加pan手势
2. 添加一个成员变量，记录前一次滑动的point
3. Pan的手势处理中更改view的frame

都是很简单的操作，在category中需要用objc_setAssociatedObject的方式去保存成员变量
完成这些，view就可以滑动了

###三. 功能扩展
如果只是简单的拖动view，那也需要做些额外的工作去完成某些需求，所以这里扩充一些功能，一般可以拖动的view都会有回到原处的功能，或者拖动一段距离松手后就滑动离开屏幕内，如开始的图片所示，所以扩展功能主要添加了动画回到原处和消失在屏幕外的功能

```
//设置可滑动的距离，以及滑动过程的各个回调
/*
 *  @param inset 以自己为中心，四周可以滑动的距离
 *  @param beginBlock pan手势begin的回调
 *  @param moveBlock pan手势change的回调
 *  @param endBlock pan手势end和cancel的回调
 */
- (void)lh_dragWithBoundsInset:(UIEdgeInsets)inset beginDragBlock:(dispatch_block_t)beginBlock moveBlock:(LHDragViewMoving)moveBlock endDragBlock:(LHDragViewEndDrag)endBlock;

```

调用后就有了可以滑动的区域，以及自动回到原位的功能

```
//设置松手后的退出方向，以及滑动到多少才退出的距离
/*
 *  @param direction 动画退出的方向 可以多个方向退出
 *  @param inset 以自己为中心，四周滑动的多少距离松手后触发退出滑动区域的逻辑
 */
- (void)lh_setOutDirection:(LHViewOutDirection)direction backToOriginMoveInset:(UIEdgeInsets)inset;

```
调用后就可以按照指定方向退出滑动区域，松手后触发退出逻辑的位置由inset指定的

```
//设置松手后动画的时间
/*
 *  @param timeInterval 动画回到原位或者退出到边缘的时间，根据view实时的位置算比例的到真实的，默认0.3
 */
- (void)lh_setDismissDuration:(NSTimeInterval)timeInterval;

```
设置动画的时间，会根据当前动画的距离算出占用最长距离的比例，然后得到动画的真正时间

```
//设置松手后退出滑动区域的相对最初位置的距离
/*
 *  @param inset 松手触发退出滑动区域的逻辑后，回到的位置离最初位置的距离
 */
- (void)lh_setDragOutFrameInset:(UIEdgeInsets)inset;

```
设置松手view移动的距离inset，分别top, left，bottom,right等偏移

```
//设置是否允许松手后view的滑动，默认是NO
/*
 *  @param disable 禁止松手自动滑动的功能
 */
- (void)lh_setDragViewUpMoveDisable:(BOOL)disable;

```
设置禁止松手后的滑动功能
```
//设置是否允许松手后view的滑动，默认是NO
- (void)lh_setDragViewUpMoveDisable:(BOOL)disable;
```



[简书](https://www.jianshu.com/p/f6dd8cbb1c62)