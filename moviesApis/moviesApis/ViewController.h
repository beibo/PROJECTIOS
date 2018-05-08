//
//  ViewController.h
//  moviesApis
//
//  Created by aya kandeel on 3/2/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "moviesVars.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "myCollectionViewController.h"
#import "Detailsmove.h"
#import "favouriteViewController.h"

#import "DataFavouritMovie.h"

@interface ViewController : UIViewController


//@property myCollectionViewController * frist;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property Detailsmove *detailmove;

@property (nonatomic) moviesVars *moviesValues;

- (IBAction)markFav:(id)sender;
//@property DataFavouritMovie* instance;

@property DataFavouritMovie * DFM;


@property (weak, nonatomic) IBOutlet UILabel *orgnaltitle;

@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *rate;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;

- (IBAction)Actionyoutube:(id)sender;




@end

