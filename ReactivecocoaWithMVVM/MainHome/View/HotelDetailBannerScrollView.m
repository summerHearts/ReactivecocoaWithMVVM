//
//  BannerScrollView.m
//  BHFangChuang
//
//  Created by Kenvin on 16/8/9.
//  Copyright © 2016年 上海方创金融股份信息服务有限公司. All rights reserved.
//

#import "HotelDetailBannerScrollView.h"
#import "UIImageView+WebCache.h"
#import "BannerImageScrollView.h"
#import "MainHomeModel.h"
//底部View高度
#define scrollViewHeight 164

#define kParallaxDeltaFactor 0.5f

static CGFloat bottomViewHeight=30.0f;
//每个pageControl点位大小

@interface HotelDetailBannerScrollView()<UIScrollViewDelegate>

/**
 *	界面控件
 */

//ScrollView
@property (nonatomic,strong) UIScrollView *scrollView;

/**
 *	PageControl
 */

/**
 *	数据
 */
@property (nonatomic,strong) UIView * maskView;
//主数组
@property (nonatomic,strong) NSMutableArray *bannerArray;

//ImageView数组
@property (nonatomic,strong) NSMutableArray *bannerImageViewArray;


//是否循环
@property (nonatomic,assign) BOOL isLoop;

//计时器
@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,assign) NSInteger pageNumber;
@end

@implementation HotelDetailBannerScrollView

#pragma mark - Life Cycle

- (void)dealloc{
    _pagecontrol=nil;
    _bannerArray=nil;
    _bannerImageViewArray=nil;
    _scrollView.delegate=nil;
    _scrollView = nil;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self initViews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
    [self initViews];
}

#pragma mark - SubViews UI

-(void)initViews{
    //scrollView
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.pagingEnabled=YES;
    _scrollView.delegate=self;
    _scrollView.clipsToBounds=NO;
    [self addSubview:_scrollView];
  

    _projectNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, 170, 280, 25)];
    _projectNameLabel.textColor = [UIColor whiteColor];
    _projectNameLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:_projectNameLabel];
    
    
    _projectDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(22, _projectNameLabel.y+_projectNameLabel.height+20, 220, 25)];
    _projectDetailLabel.textColor = [UIColor whiteColor];
    _projectDetailLabel.font = [UIFont systemFontOfSize:12];
    _projectDetailLabel.alpha = 1.0f;
    [self addSubview:_projectDetailLabel];
    
    //图片数组
    self.pictureLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.width - 70, self.height - 25, 60, 20)];
    self.pictureLabel.font = FONT(13);
    self.pictureLabel.textAlignment = NSTextAlignmentRight;
    self.pictureLabel.backgroundColor = [UIColor clearColor];
    self.pictureLabel.textColor = [UIColor whiteColor];
//    [self addSubview:self.pictureLabel];
    //底部View
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-bottomViewHeight, [UIScreen mainScreen].bounds.size.width, bottomViewHeight)];
    [self addSubview:bottomView];
    //底部pageControl
    _pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 0, 25)];
    _pagecontrol.center = CGPointMake(bottomView.frame.size.width/2, bottomViewHeight/2);
    _pagecontrol.currentPage=0;
    [_pagecontrol setPageIndicatorTintColor:[UIColor colorWithHexString:@"00b5e2"]];
    [_pagecontrol setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    
    [bottomView addSubview:_pagecontrol];
}

#pragma mark - Private Methods

- (void)addImageView:(NSInteger)number{
    
    BannerImageScrollView *bannerImageScrollView=[[BannerImageScrollView alloc]initWithFrame:CGRectMake(number*[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height)];
  
    [_scrollView addSubview:bannerImageScrollView];
    [_bannerImageViewArray addObject:bannerImageScrollView];
    
    UITapGestureRecognizer *scrollViewTapGestureRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewTap:)];
    scrollViewTapGestureRecognizer.numberOfTapsRequired= 1;
    scrollViewTapGestureRecognizer.numberOfTouchesRequired = 1;
    bannerImageScrollView.userInteractionEnabled=YES;
    [bannerImageScrollView addGestureRecognizer:scrollViewTapGestureRecognizer];
}
#pragma mark - Public Methods

- (void)layoutHeaderViewForScrollViewOffset:(CGPoint)offset
{
    CGRect frame = self.scrollView.frame;
    NSInteger page = _scrollView.contentOffset.x / self.bounds.size.width;
    BannerImageScrollView *bannerImageScrollView=[_bannerImageViewArray objectAtIndex:page];
    if (offset.y > 0){
        self.clipsToBounds=YES;
        frame.origin.y = MAX(offset.y *kParallaxDeltaFactor, 0);
        self.scrollView.frame = frame;
    }
    else{
        self.clipsToBounds=NO;
        CGFloat delta = 0.0f;
        CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height);
        delta = fabs(MIN(0.0f, offset.y));
        self.scrollView.frame = rect;
        rect.origin.y -= delta;
        rect.size.height += delta;
        rect.origin.x=bannerImageScrollView.frame.origin.x;
        bannerImageScrollView.frame = rect;
    }
}

#pragma mark - Data Source

- (void)loadBannerSourceSignal:(RACSignal *)source isLoop:(BOOL)isLoop{
    @weakify(self);
    [source subscribeNext:^(id x) {
        @strongify(self);
        [self loadBannerItemArray:x isLoop:YES];
    }];
}

- (void)loadBannerItemArray:(NSMutableArray *)bannerArray isLoop:(BOOL)isLoop{
    
    //图片
    _bannerImageViewArray=[[NSMutableArray alloc]initWithCapacity:self.topListArray.count+2];
    for (NSInteger i=0; i<self.topListArray.count+2; i++) {
        [self addImageView:i];
    }
    
    //数据
    _isLoop=isLoop;
    NSMutableArray *bannerUrlArray = [NSMutableArray array];
    for (int i = 0; i<bannerArray.count; i++) {
        RecommendListData *listData = [bannerArray objectAtIndex:i];
        [bannerUrlArray addObject:listData.path];
    }
    _bannerArray=bannerUrlArray;
    //pageControl
    _pagecontrol.numberOfPages=bannerUrlArray.count;
    _pagecontrol.currentPage=0;
     self.pictureLabel.text = [NSString stringWithFormat:@"%d/%lu",1,(unsigned long)_bannerArray.count];
    
    //判断数据是否为1
    if (bannerArray.count==1) {
        _isLoop=NO;
        [_pagecontrol setHidden:YES];
        _scrollView.scrollEnabled=NO;
    }else{
        [_pagecontrol setHidden:NO];
        _scrollView.scrollEnabled=YES;
    }
    //循环
    if(_isLoop){
        if (_bannerArray==nil||_bannerArray.count==0) {
            return;
        }
        NSString *firstItem =[bannerArray firstObject];
        NSString *lastItem =[bannerArray lastObject];
        [bannerArray insertObject:lastItem atIndex:0];
        [bannerArray addObject:firstItem];
    }
    //计时器
    if (_isLoop) {
        //设置NSTimer
        if (!_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoChangePage) userInfo:nil repeats:YES];
        }
    }else{
        [_timer invalidate];
        _timer=nil;
    }
    //scrollView
    [_scrollView setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width*bannerArray.count, 0)];
    if (_isLoop) {
        //刷新的bane数量小于以前数量且以前选中的数字大
        if (_pagecontrol.currentPage<_pagecontrol.numberOfPages) {
            [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*(_pagecontrol.currentPage+1), 0)];
        }else{
            [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*(_pagecontrol.numberOfPages-1+1), 0)];
        }
    }else{
        if (_pagecontrol.currentPage<_pagecontrol.numberOfPages) {
            [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*_pagecontrol.currentPage, 0)];
        }else{
            [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width*_pagecontrol.numberOfPages-1, 0)];
        }
    }
    //数据加载
    //扩充Imageview
    if (_bannerArray.count>_bannerImageViewArray.count) {
        for (NSInteger i=_bannerImageViewArray.count; i<_bannerArray.count; i++) {
            [self addImageView:i];
        }
    }
    //图片
    for (int i=0; i<_bannerImageViewArray.count; i++) {
        BannerImageScrollView *bannerImageView=[_bannerImageViewArray objectAtIndex:i];
        if (i<_bannerArray.count) {
            
            [[SDWebImageManager sharedManager]downloadImageWithURL:[NSURL URLWithString:[self.bannerArray objectAtIndex:i]] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                
            } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                if (image.size.width<SCREEN_WIDTH*2) {
                    [bannerImageView.imageView sd_setImageWithURL:[NSURL URLWithString:[self.bannerArray objectAtIndex:i]]];
                }else{
                    [bannerImageView.imageView setImage:image];
                }
            }];
        }else{
            [bannerImageView.imageView setImage:nil];
        }
        
    }
}

#pragma mark - Timer

-(void)autoChangePage{
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x+self.bounds.size.width, 0) animated:YES];
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    _scrollView.userInteractionEnabled=NO;
    if (_isLoop) {
        if (!_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(autoChangePage) userInfo:nil repeats:YES];
        }
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _scrollView.userInteractionEnabled=YES;
    int page = _scrollView.contentOffset.x / self.bounds.size.width;
    if (_isLoop) {
        //循环
        if (page == 0) {
            [_scrollView setContentOffset:CGPointMake((_bannerArray.count-2)*self.bounds.size.width, 0)];
            self.pageNumber = _bannerArray.count-3;
            self.pagecontrol.currentPage = _bannerArray.count-3;
        }else if (page == _bannerArray.count-1) {
            [_scrollView setContentOffset:CGPointMake(self.bounds.size.width, 0)];
            self.pagecontrol.currentPage = 0;
            self.pageNumber = 0;
        }else{
            self.pagecontrol.currentPage = page-1;
            self.pageNumber = page - 1;
            
        }
        self.pictureLabel.text = [NSString stringWithFormat:@"%ld/%lu",(long)self.pageNumber+1,(unsigned long)_bannerArray.count - 2];
    }else{
        self.pagecontrol.currentPage = page;
    }

}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    _scrollView.userInteractionEnabled=YES;
    int page = _scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
       if (_isLoop) {
        //循环
        if (page == 0) {
            [_scrollView setContentOffset:CGPointMake((_bannerArray.count-2)*[UIScreen mainScreen].bounds.size.width, 0)];
            self.pageNumber = _bannerArray.count-3;
            self.pagecontrol.currentPage = _bannerArray.count-3;
        }else if (page == _bannerArray.count-1) {
            [_scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0)];
            self.pagecontrol.currentPage = 0;
            self.pageNumber = 0;
        }else{
            self.pagecontrol.currentPage = page - 1;
            self.pageNumber = page-1;
        }
        self.pictureLabel.text = [NSString stringWithFormat:@"%ld/%lu",(long)self.pageNumber+1,(unsigned long)_bannerArray.count - 2];
       
           
    }else{
        self.pagecontrol.currentPage = page;
    }
    
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (_timer) {
        [_timer invalidate];
        _timer=nil;
    }
}

#pragma mark - GestureRecognizer

-(void)scrollViewTap:(UITapGestureRecognizer *)gestureRecognizer{

     if (self.delegateSubject) {
         [self.delegateSubject sendNext:@(_pagecontrol.currentPage)];
     }
}

- (RACSubject *)delegateSubject{
    if (!_delegateSubject) {
        _delegateSubject = [RACSubject subject];
    }
    return _delegateSubject;
}
@end
