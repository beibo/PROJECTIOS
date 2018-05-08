//
//  moviesVars.h
//  moviesApis
//
//  Created by aya kandeel on 3/2/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface moviesVars : NSObject




@property (strong, nonatomic)NSString *original_title;

@property (strong, nonatomic)NSString *poster_path;

@property (strong, nonatomic)NSString *release_date;

@property (strong, nonatomic)NSString *vote_average;
@property (strong, nonatomic)NSString *overview;
@property (strong, nonatomic)NSString *mid;


- (id)initWithOverview:(NSString *)aOverview

             poster_path:(NSString *)aPoster_path
         original_title:(NSString *)aOriginal_title
        release_date:(NSString *)aRelease_date

          vote_average:(NSString *)aVote_average
mid:(NSString *)aMid

;

- (id)initWithDictionary:(NSDictionary *)dic;


@end
