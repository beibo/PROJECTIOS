//
//  DataFavouritMovie.m
//  moviesApis
//
//  Created by aya kandeel on 3/9/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import "DataFavouritMovie.h"
#import <sqlite3.h>

@implementation DataFavouritMovie



-(id) init{
    
    self = [super init];
    if(self){
        _dbName = @"contacts2.db";
        _tableName = @"movies";
    }
    
    return self;
}
-(NSString*)startDBConnection{
    
    NSString *docsDir;
    NSArray *dirPaths;
    
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    // Build the path to the database file
    _databasePath = [[NSString alloc]
                     initWithString: [docsDir stringByAppendingPathComponent:
                                      _dbName]];
    
    
    const char *dbpath = [_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        char *errMsg;
        NSString* temp = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, m_title TEXT,m_date text,m_img TEXT,m_overView TEXT,m_rate text)",_tableName];
        
        const char *sql_stmt = [temp UTF8String];
        
        if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
        {
            return @"Failed to create table";
            printf("Failed to create table");
        }
        sqlite3_close(_contactDB);
    } else {
        return @"Failed to open/create database";
        printf("Failed to open/create database");
    }
    
    return @"Succeded";
    printf("Succeded");
    
}


-(BOOL)addmovie:(Detailsmove *)DMovie{
    printf("%s",[DMovie.title UTF8String]);
    NSString *statment=[NSString  stringWithFormat:@"insert into \"%@\" (id,m_title,m_date,m_img,m_overview,m_rate)values(\"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")",_tableName,DMovie.mid,DMovie.title,DMovie.date,DMovie.img,DMovie.mytext,DMovie.rate];
    
    
    sqlite3_stmt    *statement;
    const char *dbpath = [_databasePath UTF8String];
    BOOL inserted= NO;
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        
        NSString *insertSQL = statment;
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt,
                           -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            inserted = YES;
        } else {
            inserted = NO;
        }
        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
    
    return inserted;
}


-(NSMutableArray *)getALLRecordes{
    NSMutableArray *data = [NSMutableArray new];
    
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt    *statement;
    
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"SELECT * FROM %@",_tableName];
        
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(_contactDB,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                
                NSString *idField
                = [[NSString alloc] initWithUTF8String:
                   (const char *) sqlite3_column_text(statement, 0)];
                
                
                NSString *titleField
                = [[NSString alloc] initWithUTF8String:
                   (const char *) sqlite3_column_text(statement, 1)];
                
                NSString *dateField = [[NSString alloc]
                                       initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement, 2)];
                
                NSString *imgField = [[NSString alloc]
                                      initWithUTF8String:(const char *)
                                      sqlite3_column_text(statement, 3)];
                
                
                NSString *overviewField = [[NSString alloc]
                                           initWithUTF8String:(const char *)
                                           sqlite3_column_text(statement, 4)];
                
                
                
                NSString *rateField = [[NSString alloc]
                                       initWithUTF8String:(const char *)
                                       sqlite3_column_text(statement, 5)];
                
                
                
                
                
                
                Detailsmove *dm = [Detailsmove new];
                [dm setMid:idField];
                [dm setTitle:titleField];
                [dm setDate:dateField];
                [dm setImg:imgField];
                [dm setMytext:overviewField];
                [dm setRate:rateField];
                [data addObject: dm];
                
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
    
    return data;
}

+(id)getInstance{
    static DataFavouritMovie* myInstance;
    static dispatch_once_t dispatch;
    dispatch_once(&dispatch,^{
        myInstance = [DataFavouritMovie new];
        [myInstance startDBConnection];
    });
    
    return myInstance;
    
}





@end
