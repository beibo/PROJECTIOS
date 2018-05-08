//
//  favouriteViewController.h
//  moviesApis
//
//  Created by aya kandeel on 3/9/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataFavouritMovie.h"
#import <SDWebImage/UIImageView+WebCache.h>


#import "moviesVars.h"
#import "ViewController.h"
#import "Detailsmove.h"

@interface favouriteViewController : UICollectionViewController

@property DataFavouritMovie *DFM;
@property NSMutableArray *Data;

@property Detailsmove * detialmove;

@end
