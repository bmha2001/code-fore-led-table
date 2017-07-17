//
//  ViewController.h
//  app for led table
//
//  Created by Brian Mhatre on 7/3/17.
//  Copyright © 2017 Brian Mhatre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>


@interface ViewController : UIViewController <CBPeripheralDelegate, CBCentralManagerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) CBCentralManager *centralManager;
@property (strong, nonatomic) NSMutableDictionary *devices;         //data structure to store discoverd 
@property (strong, nonatomic) CBPeripheral *discoveredPeripheral;   //Global varible for a discovered perpheral
@property (strong, nonatomic) CBPeripheral *selectedPeripheral;    // DONT USE THIS VARIABLE
@property (readonly, nonatomic) CFUUIDRef UUID;
@property (strong, nonatomic) CBCharacteristic *characteristics;
@property (strong, nonatomic) NSMutableData *data;


@end

