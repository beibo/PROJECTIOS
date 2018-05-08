//
//  favouriteViewController.m
//  moviesApis
//
//  Created by aya kandeel on 3/9/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import "favouriteViewController.h"
#import "AFHTTPSessionManager.h"
@interface favouriteViewController ()


//@property (nonatomic, strong)NSArray *movies;

//@property (nonatomic, strong)NSMutableArray *movies;

@end

@implementation favouriteViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];

    
   
    
    _DFM=[DataFavouritMovie getInstance];
    
    [_DFM startDBConnection];
    _Data=[_DFM getALLRecordes];
    
   // NSString *str =[[_Data objectAtIndex:0] img];
   // NSLog(@"%@",str);
    //printf("%d",_Data.count);
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.s
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.Data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    
    UIImageView *myimg=[cell viewWithTag:1];
    
   
    
   // NSLog(@"%@",[self.Data[indexPath.row] img]);
    //[myimg sd_setImageWithURL:[self.Data[indexPath.row] img]];
    
//    NSString *myimge=[self.Data[indexPath.row] img];
//    NSLog(@"%@",myimge);
    
[myimg  sd_setImageWithURL:[NSURL URLWithString:[self.Data[indexPath.row] img]]];
   
   // myimg.image=[UIImage imageNamed:@"1.png"];

  return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath{
    
    
    ViewController * second=[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    
    [_detialmove setTitle:[self.Data[indexPath.row] title]];
    
    
    [second setDetailmove:_Data[indexPath.row]];

    
    
    
    NSLog(@"%@",second.detailmove.title);
    
   [self.navigationController pushViewController:second animated:YES];
    
    
   // [self presentViewController:second animated:YES completion:nil];

    
}




/*

- (void)loadMovies:(NSString *)urlfilm {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    NSString * urlmyfilms=@"https://api.themoviedb.org/3/discover/movie?sort_by=";
    urlmyfilms=[urlmyfilms stringByAppendingString:urlfilm];
    urlmyfilms=[urlmyfilms stringByAppendingString:@"&api_key=b32f39d60ff86750085a55dbe59c6aab"];
    
    
    [manager GET:urlmyfilms parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSDictionary *jsonArray = (NSDictionary *)responseObject;
        NSMutableArray *tempNinjas = [[NSMutableArray alloc] init];
        
        //NSDictionary *dic1;
        NSMutableArray * myarr=[jsonArray objectForKey:@"results"];
        // NSLog(@"%@",[myarr[0] objectForKey:@"title"]);
        
        for (NSDictionary *dic in myarr) {
            moviesVars *moviesVar = [[moviesVars alloc] initWithDictionary:dic];
            [tempNinjas addObject:moviesVar];
        }
        
        self.movies = [[NSArray alloc] initWithArray:tempNinjas];
        tempNinjas = nil;
        
        
        
        
        [self.collectionView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(error);
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error Retrieving Ninjas"
                                                                         message:[error localizedDescription]
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
        
        [alertVC addAction:okAction];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }];
    
}

*/





#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
