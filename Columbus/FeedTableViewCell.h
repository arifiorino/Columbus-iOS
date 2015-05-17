//
//  FeedTableViewCell.h
//  Proximal
//
//  Created by Ari Fiorino on 5/17/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewCell : UITableViewCell
@property (nonatomic, retain) IBOutlet UIImageView* postImageView;
@property (nonatomic, retain) IBOutlet UILabel* captionLabel;
-(IBAction)upVote:(id)sender;
-(IBAction)downVote:(id)sender;
@end
