//
//  MapViewController.m
//  Proximal
//
//  Created by Ari Fiorino on 5/16/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//

#import "MapViewController.h"
#import "DetailPostViewController.h"

@implementation MapViewController

-(void)viewDidLoad{
    locationManager=[[CLLocationManager alloc] init];
    locationManager.delegate=self;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    //self.mapView.showsUserLocation=TRUE;
    self.mapView.mapType=MKMapTypeStandard;
    //[self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    self.mapView.delegate=self;
}
-(void)viewDidAppear:(BOOL)animated{
    self.mapView.delegate=self;
    NSLog(@"There are %d posts.", allPosts.count);
    [_mapView removeAnnotations:_mapView.annotations];
    for (PostClass* post in allPosts){
        [self.mapView addAnnotation:post.point];
    }
}
- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation{
    MKPinAnnotationView *annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"SimpleTableIdentifier"];
    
    if (![annotation.title isEqualToString:@"Current Location"]){
        int postIndex = -1;
        int i=0;
        for (PostClass* post in allPosts){
            if(annotation==post.point){
                postIndex=i;
            }
            i++;
        }
        NSLog(@"Post index: %d", postIndex);
        UIImageView *imageView = [[UIImageView alloc] initWithImage:((PostClass*)[allPosts objectAtIndex:postIndex]).image];
        
        annView.image=[[UIImage alloc] init];
        
        [imageView setFrame:CGRectMake(-50+8-5, -110+8, 100-16, 100-16)];
        [annView addSubview:imageView];
        imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"border.png"]];
        [imageView setFrame:CGRectMake(-50-5, -110, 100, 110)];
        [annView addSubview:imageView];
        //annView.animatesDrop = TRUE;
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        ///[rightButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
        annView.rightCalloutAccessoryView = rightButton;
        
        annView.canShowCallout = YES;
        annView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //annView.calloutOffset = CGPointMake(-5, 5);
    }
    return annView;
}
-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    postIndex = -1;
    int i=0;
    
    for (PostClass* post in allPosts){
        if(view.annotation==post.point){
            postIndex=i;
        }
        i++;
    }
    NSLog(@"%d", postIndex);
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailPostViewController* detailViewController=[segue destinationViewController];
    detailViewController.posts=[[NSMutableArray alloc] init];
    [detailViewController.posts addObject:[allPosts objectAtIndex:postIndex]];
    [detailViewController viewDidLoad];
}

@end
