//
//  DetailPostViewController.h
//  Proximal
//
//  Created by Ari Fiorino on 5/17/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//
#import "PostClass.h"
#import <UIKit/UIKit.h>

@interface DetailPostViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) IBOutlet UITableView *feedTable;
@property (nonatomic, retain) NSMutableArray* posts;
@end
