//
//  ViewController.m
//  GridViewsColors
//
//  Created by Giuseppe Santaniello on 06/04/14.
//  Copyright (c) 2014 Giuseppe Santaniello. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"
#import "Grid.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *myViews;
@property (nonatomic, strong) Grid *grid;
@property (weak, nonatomic) IBOutlet UIView *gridView;

@property (nonatomic) CGSize maxViewSize;
@end

@implementation ViewController

#define NUMBER_OF_VIEWS 25
#define CARDSPACINGINPERCENT 0.08

-(NSMutableArray *)myViews
{
    if(!_myViews) _myViews = [[NSMutableArray alloc] init];
    return _myViews;
}

-(Grid *)grid
{
    if(!_grid){
        
        _grid = [[Grid alloc] init];
        _grid.cellAspectRatio = self.maxViewSize.width / self.maxViewSize.height;
        _grid.minimumNumberOfCells = NUMBER_OF_VIEWS;
        _grid.maxCellWidth = self.maxViewSize.width;
        _grid.maxCellHeight = self.maxViewSize.height;
        _grid.size = self.gridView.frame.size;
        
    }
    return _grid;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.maxViewSize = CGSizeMake(100.0, 140.0);
    
    for(int i = 0; i<= NUMBER_OF_VIEWS-1; i++){
        myView *view = [[myView alloc] init];
        [self.myViews addObject:view];
        [self.gridView addSubview:view];
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.grid.size = self.gridView.frame.size;
    [self updateUI];
}

-(void)updateUI
{
    
    for(myView *coloredView in self.myViews){
        
        NSInteger viewIndex = [self.myViews indexOfObject:coloredView];
        CGRect frame = [self.grid frameOfCellAtRow:viewIndex / self.grid.columnCount
                                          inColumn:viewIndex % self.grid.columnCount];
        
        frame = CGRectInset(frame, frame.size.width * CARDSPACINGINPERCENT, frame.size.height * CARDSPACINGINPERCENT);
        
        
//        [UIView animateWithDuration:0.5 animations:^{
//            coloredView.frame = frame;
//        } completion:^(BOOL finished) {
//            NULL;
//        }];

        [UIView animateWithDuration:0.5
                              delay:1.5 * viewIndex / [self.myViews count]
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             coloredView.frame = frame;
                         } completion:NULL];
        
    }
    
    
    /*
    for (NSUInteger index = 0; index < NUMBER_OF_VIEWS; index++) {
        
        NSUInteger viewIndex = [self.myViews indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[UIView class]]) {
                if (((UIView *)obj).tag == index){
                    return YES;
                }
            }
            return NO;
        }];
        
        myView *coloredView;
        if (viewIndex == NSNotFound) {
            coloredView = [[myView alloc] init];
            coloredView.tag = index;
            [self.myViews addObject:coloredView];
            viewIndex = [self.myViews indexOfObject:coloredView];
            [self.gridView addSubview:coloredView];
        } else {
            coloredView = self.myViews[viewIndex];
        }
        

        CGRect frame = [self.grid frameOfCellAtRow:viewIndex / self.grid.columnCount
                                          inColumn:viewIndex % self.grid.columnCount];
        frame = CGRectInset(frame, frame.size.width * CARDSPACINGINPERCENT, frame.size.height * CARDSPACINGINPERCENT);
        coloredView.frame = frame;
    }
    */
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    // Status bar text should be white.
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
