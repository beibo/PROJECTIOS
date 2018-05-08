//
//  ViewController.m
//  moviesApis
//
//  Created by aya kandeel on 3/2/18.
//  Copyright © 2018 aya kandeel. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"
#import "favouriteViewController.h"

@interface ViewController ()




//@property myCollectionViewController * frist;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   

  
    [_orgnaltitle setText:_detailmove.title];
    
    [_myTextView setText:_detailmove.mytext];
    [_date setText:_detailmove.date];
    
    
    
    [_rate setText:[NSString stringWithFormat:@"Rate : %@",_detailmove.rate] ];
    
  
    [_myImage  sd_setImageWithURL:[NSURL URLWithString:_detailmove.img]];
    
    
//    NSLog(@"%@",_detailmove.date);
//    NSLog(@"%@",_detailmove.img);
//    NSLog(@"%@",_detailmove.rate);

    
    
   // _frist=[myCollectionViewController new];
   
    DataFavouritMovie *dataFav;
    
    //[dataFav startDBConnection];
    
    _DFM=[DataFavouritMovie getInstance];
    
    
    
//https://api.themoviedb.org/3/movie/550?api_key=b32f39d60ff86750085a55dbe59c6aab

    
    //popular movies
//https://www.themoviedb.org/discover/movie?sort_by=popularity.desc&api_key=b32f39d60ff86750085a55dbe59c6aab
    

    //image
//http://image.tmdb.org/t/p/w185/nBNZadXqJSdt05SHLqgT0HuC5Gm.jpg
    
 

//[_myImage sd_setImageWithURL:[NSURL URLWithString:@"https://api.androidhive.info/json/movies/1.jpg"]
  //              placeholderImage:[UIImage imageNamed:@"1.png"]];
    
    
    //self.title = [self.moviesValues name];
   
   // self.desc.text = self.moviesValues.desc;
    
   
   // [_myImage sd_setImageWithURL:[NSURL URLWithString:self.moviesValues.poster_path]
     //          placeholderImage:[UIImage imageNamed:@"1.png"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)Actionyoutube:(id)sender {
    
    NSString *urlvido=@"https://api.themoviedb.org/3/movie/";
    urlvido=[urlvido stringByAppendingString:[NSString stringWithFormat:@"%@",_detailmove.mid]];
    urlvido=[urlvido stringByAppendingString:@"/videos?api_key=b32f39d60ff86750085a55dbe59c6aab&language=en-US"];
    
   // NSLog(@"%@",urlvido);
    
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    [manager GET:urlvido parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
       
        NSDictionary *jsonArray = (NSDictionary *)responseObject;
      //  NSMutableArray *temp = [[NSMutableArray alloc] init];
        
        //NSDictionary *dic1;
        NSMutableArray * myarr=[jsonArray objectForKey:@"results"];
        
        
        // NSLog(@"%@",[myarr[0] objectForKey:@"key"]);
        NSString *videoName = [myarr[0] objectForKey:@"key"];
        NSString *string = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", videoName];
        NSURL *url = [NSURL URLWithString:string];
        UIApplication *app = [UIApplication sharedApplication];
        [app openURL:url];

     

    
    
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
- (IBAction)markFav:(id)sender {

    
favouriteViewController *favourite=[self.storyboard instantiateViewControllerWithIdentifier:@"favourite"];
    
    
    [_DFM startDBConnection];
    
    [_DFM addmovie:_detailmove];
    
 
    
    
    //[self.navigationController pushViewController:favourite animated:YES];
   // NSLog(@"%@",_detailmove.img);
    
    
    
    
    
}
@end
