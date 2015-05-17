//
//  FeedViewController.h
//  Proximal
//
//  Created by Ari Fiorino on 5/17/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, retain) IBOutlet UITableView *feedTable;
-(void)loadPosts;
@end
