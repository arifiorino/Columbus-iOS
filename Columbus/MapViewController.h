//
//  MapViewController.h
//  Proximal
//
//  Created by Ari Fiorino on 5/16/15.
//  Copyright (c) 2015 Azul Engineering. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "PostClass.h"
CLLocationManager *locationManager;
@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>{
    int postIndex;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@end
