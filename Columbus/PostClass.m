//
//  PostClass.m
//  Proximal
//
//  Created by Ari Fiorino on 5/16/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//

#import "PostClass.h"

@implementation PostClass
-(void)initWithImageData:(NSString*)imageData caption:(NSString*)caption postID:(NSString*)postID lo:(float)lo lat:(float)lat{
    _image = [UIImage imageWithData:[[NSData alloc]initWithBase64EncodedString:imageData options:NSDataBase64DecodingIgnoreUnknownCharacters]];
    _imageData=imageData;
    _postID=postID;
    _caption=caption;
    _coordinate=CLLocationCoordinate2DMake(lat, lo);
    _point=[MKPointAnnotation alloc];
    _point.coordinate=_coordinate;
    _point.title=_caption;
}
-(void)initWithImageData:(NSString*)imageData caption:(NSString*)caption postID:(NSString*)postID coor:(CLLocationCoordinate2D)coor{
    _image = [UIImage imageWithData:[[NSData alloc]initWithBase64EncodedString:imageData options:NSDataBase64DecodingIgnoreUnknownCharacters]];
    _imageData=imageData;
    _postID=postID;
    _caption=caption;
    _coordinate=coor;
    _point=[MKPointAnnotation alloc];
    _point.coordinate=_coordinate;
    _point.title=_caption;
}
@end