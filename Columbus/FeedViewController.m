//
//  FeedViewController.m
//  Proximal
//
//  Created by Ari Fiorino on 5/17/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//

#import "FeedViewController.h"
#import "FeedTableViewCell.h"
#import "PostClass.h"
#import "DetailPostViewController.h"

@implementation FeedViewController
-(void)viewDidAppear:(BOOL)animated{
    [self loadPosts];
    _feedTable.delegate=self;
    [_feedTable reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return allPosts.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int row=indexPath.row;
    FeedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Post" forIndexPath:indexPath];
    //cell.postImageView=[[UIImageView alloc];
    cell.postImageView.image=((PostClass*)[allPosts objectAtIndex:row]).image;
    cell.captionLabel.text=((PostClass*)[allPosts objectAtIndex:row]).caption;
    return cell;
}
-(void)loadPosts{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://192.168.43.175/view?longitude=1&latitude=1&radius=10&page=0&numpost=10"]];
    NSError* error;
    NSData* urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    if (error){
        NSLog(@"%@", error.description);
    }
    NSLog(@"%@", [NSString stringWithUTF8String:[urlData bytes]]);
    NSError *e = nil;
    NSString* jsonString=[NSString stringWithUTF8String:[urlData bytes]];
    NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData: urlData options: NSJSONReadingAllowFragments error: &e];
    
    if (!jsonArray) {
        NSLog(@"Error parsing JSON: %@", e);
    } else {
        NSLog(@"%@", [jsonArray objectForKey:@"posts"]);
        for(NSDictionary* post in jsonArray){
            
        }
    }
    
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //NSLog(@"%@", segue.identifier);
    //if ([segue.identifier isEqual:@"showDetail"]){
        DetailPostViewController* detailViewController=[segue destinationViewController];
        detailViewController.posts=[[NSMutableArray alloc] init];
        [detailViewController.posts addObject:[allPosts objectAtIndex:[[_feedTable indexPathForSelectedRow] row]]];
        [detailViewController viewDidLoad];
        [_feedTable deselectRowAtIndexPath:[_feedTable indexPathForSelectedRow] animated:YES];
         //}
}
@end
