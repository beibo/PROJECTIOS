//
//  DataFavouritMovie.h
//  moviesApis
//
//  Created by aya kandeel on 3/9/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Detailsmove.h"
#import <sqlite3.h>

@interface DataFavouritMovie : NSObject{
@private DataFavouritMovie* instance;
    
}
@property (strong , nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;
@property NSString* dbName, *tableName;


-(NSString*)startDBConnection;
-(BOOL)addmovie:(Detailsmove *)DMovie;
-(NSMutableArray*) getALLRecordes;
-(BOOL)deleteContact:(int)userID;
-(void)saveData:(Detailsmove *)Dmovie;
+(id) getInstance;


@end
