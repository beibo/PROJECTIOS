//
//  myCollectionViewController.h
//  moviesApis
//
//  Created by aya kandeel on 3/2/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "moviesVars.h"
#import "ViewController.h"
#import "Detailsmove.h"



@interface myCollectionViewController : UICollectionViewController

@property (weak, nonatomic) IBOutlet UIImageView *myImage2;
@property Detailsmove * detialmove;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *sortbutton;

- (IBAction)sortMovies:(id)sender;

@end
