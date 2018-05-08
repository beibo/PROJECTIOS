//
//  moviesVars.m
//  moviesApis
//
//  Created by aya kandeel on 3/2/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import "moviesVars.h"

@implementation moviesVars

- (instancetype)initWithOverview:(NSString *)aOverview


                 poster_path:(NSString *)aPoster_path
              original_title:(NSString *)aOriginal_title
                release_date:(NSString *)aRelease_date
                    vote_average:(NSString *)aVote_average
             mid:(NSString *)aMid



{
    self = [super init];
    
    if (self) {
        
        self.original_title = aOriginal_title;
        self.release_date= aRelease_date;
        self.overview = aOverview;
        self.poster_path = aPoster_path;
        self.vote_average=aVote_average;
        self.mid=aMid;

  
        
    }
    
    return self;
}

-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self=[self initWithOverview:dic[@"overview"] poster_path:dic[@"poster_path"] original_title:dic[@"original_title"] release_date:dic[@"release_date"] vote_average:dic[@"vote_average"] mid:dic[@"id"] ];
    return self;
}


- (instancetype)init {
    self=[self initWithOverview:@"" poster_path:@""  original_title:@""  release_date:@""  vote_average:@""  mid:@"" ];
    return self;
}



//
//- (NSString *)description {
//    return [NSString stringWithFormat:@"%@ : %@", self.name, self.description ,self.original_title] ;
//}


@end
