//
//  DetailPostViewController.m
//  Proximal
//
//  Created by Ari Fiorino on 5/17/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//
#import "FeedTableViewCell.h"
#import "DetailPostViewController.h"

@implementation DetailPostViewController
-(void)viewDidLoad{
    
    [_feedTable reloadData];
}
-(void)viewDidAppear:(BOOL)animated{
    [_feedTable reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _posts.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    int row=indexPath.row;
    FeedTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Post" forIndexPath:indexPath];
    //cell.postImageView=[[UIImageView alloc];
    cell.postImageView.image=((PostClass*)[_posts objectAtIndex:row]).image;
    cell.captionLabel.text=((PostClass*)[_posts objectAtIndex:row]).caption;
    return cell;
}
@end
