//
//  PostClass.h
//  Proximal
//
//  Created by Ari Fiorino on 5/16/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
NSMutableArray* allPosts;
@interface PostClass : NSObject
@property (nonatomic, retain) NSString* caption, *postID, *imageData;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) UIImage* image;
@property (nonatomic, assign) float upVotes, downVotes;
@property (nonatomic, retain) MKPointAnnotation *point;
-(void)initWithImageData:(NSString*)imageData caption:(NSString*)caption postID:(NSString*)postID lo:(float)lo lat:(float)lat;
-(void)initWithImageData:(NSString*)imageData caption:(NSString*)caption postID:(NSString*)postID coor:(CLLocationCoordinate2D)coor;
@end
