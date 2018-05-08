//
//  myCollectionViewController.m
//  moviesApis
//
//  Created by aya kandeel on 3/2/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import "myCollectionViewController.h"
#import "AFHTTPSessionManager.h"

@interface myCollectionViewController ()

@property (nonatomic, strong)NSArray *movies;



@end

@implementation myCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    
    _detialmove=[Detailsmove new];
    
    
   // [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    
    
     [self loadMovies:@"popularity.desc"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation




#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    
    return self.movies.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    
   // cell.textLabel.text = [self.movies[indexPath.row] name];
   
    UIImageView *img=[cell viewWithTag:1];
    
    //[img sd_setImageWithURL:[NSURL URLWithString:[self.movies[indexPath.row] thumbnail]]
   //             placeholderImage:[UIImage imageNamed:@"1.png"]];
    
 //NSLog([self.movies[indexPath.row] thumbnail]);
    
   // NSLog(@"%@",[self.movies[0] poster_path] );
    
[img sd_setImageWithURL:[NSURL URLWithString: [@"http://image.tmdb.org/t/p/w185/" stringByAppendingString :[self.movies[indexPath.row] poster_path]]]];
    
    
    
    return cell;
}




- (void)loadMovies:(NSString *)urlfilm {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    NSString * urlmyfilms=@"https://api.themoviedb.org/3/discover/movie?sort_by=";
    urlmyfilms=[urlmyfilms stringByAppendingString:urlfilm];
    urlmyfilms=[urlmyfilms stringByAppendingString:@"&api_key=b32f39d60ff86750085a55dbe59c6aab"];
    
    
    [manager GET:urlmyfilms parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSDictionary *jsonArray = (NSDictionary *)responseObject;
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        
        //NSDictionary *dic1;
        NSMutableArray * myarr=[jsonArray objectForKey:@"results"];
       // NSLog(@"%@",[myarr[0] objectForKey:@"title"]);
        
        for (NSDictionary *dic in myarr) {
           moviesVars *moviesVar = [[moviesVars alloc] initWithDictionary:dic];
            [temp addObject:moviesVar];
        }
        
        self.movies = [[NSArray alloc] initWithArray:temp];
        temp = nil;

      
        [self.collectionView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(error);
        
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Error Retrieving movies"
                                                                         message:[error localizedDescription]
                                                                  preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
        
        [alertVC addAction:okAction];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }];
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/




/*
 
 -(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath{
 
 DetailCell *detailCell = [[DetailCell alloc] initWithDetails:_pageCategorie and: indexPath];
 [_nav pushViewController:detailCell animated:YES];
 
 }
 */



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath*)indexPath{
     ViewController * second=[self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    [_detialmove setTitle:[self.movies[indexPath.row] original_title]];
    [_detialmove setDate:[self.movies[indexPath.row] release_date]] ;
    //[_detialmove setDate:[self.movies[indexPath.row] release_date]];
    [_detialmove setRate:[self.movies[indexPath.row] vote_average]];
    [_detialmove setImg:[@"http://image.tmdb.org/t/p/w185/" stringByAppendingString :[self.movies[indexPath.row] poster_path]]];
    
    
    [_detialmove setMid:[self.movies[indexPath.row] mid]];
    [_detialmove setMytext:[self.movies[indexPath.row] overview] ];
    [second setDetailmove:_detialmove];
    // NSLog(@"%@",second.detailmove.title);
    

    [self.navigationController pushViewController:second animated:YES];
    
    
}



- (IBAction)sortMovies:(id)sender {
    
    
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
            
            
        case 0:
            //printf("%d",((UISegmentedControl *)sender).selectedSegmentIndex) ;
            
            [self loadMovies:@"popularity.desc"];
            break;
            
            
            
        case 1:
            //printf("%d",((UISegmentedControl *)sender).selectedSegmentIndex);
            [self loadMovies:@"top_rated"];
            break;
            
            
            
            
        default:
            break;
    }

}





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
