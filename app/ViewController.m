//
//  ViewController.m
//  app for led table
//
//  Created by Brian Mhatre on 7/3/17.
//  Copyright © 2017 Brian Mhatre. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *tableView;
//initialize buttons:
- (IBAction)base:(id)sender;

- (IBAction)circle:(id)sender;
- (IBAction)blink:(id)sender;
- (IBAction)rainbow:(id)sender;
- (IBAction)musicOn:(id)sender;
- (IBAction)musicOff:(id)sender;



@end

@implementation ViewController

//

- (IBAction)base:(id)sender {
    /*
     [peripheral readValueForCharacteristic:(CBCharacteristic *)character];
     NSLog(@"%@", character.value);
     NSLog(@"%@", [[peripheral identifier] UUIDString]);
     */
    //558ED110-7B2F-4464-AA63-AF29819DC08
    //NSLog(@"%@", [[_discoveredPeripheral identifier] UUIDString]);
    //for (NSString * uuid in [self.devices keyEnumerator]) {
     //   NSLog(@"%@", uuid);
       // NSLog(@"%@", [self.devices valueForKey: uuid]);
  //  }
    
    int integer = 49;
    NSData *data = [[NSData alloc] initWithBytes:&integer length:sizeof(integer)];
    for (NSString * uuid in [self.devices keyEnumerator]) {
    for (CBService * service in [[self.devices valueForKey: uuid] services])
    {
        NSLog(@"%@", [[service UUID] UUIDString]);
        NSLog(@"%@", uuid);
        for (CBCharacteristic * characteristic in [service characteristics])
        {
           // NSLog(@"%@", uuid);
            //NSLog(@"%@", [[characteristic UUID] UUIDString]);
            [[self.devices valueForKey: uuid] writeValue:data
                          forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
            
        }
    }
    }
}

- (IBAction)circle:(id)sender {
    int integer = 50;
    NSData *data = [[NSData alloc] initWithBytes:&integer length:sizeof(integer)];
    for (NSString * uuid in [self.devices keyEnumerator]) {
        for (CBService * service in [[self.devices valueForKey: uuid] services])
        {
            NSLog(@"%@", [[service UUID] UUIDString]);
            NSLog(@"%@", uuid);
            for (CBCharacteristic * characteristic in [service characteristics])
            {
                // NSLog(@"%@", uuid);
                //NSLog(@"%@", [[characteristic UUID] UUIDString]);
                [[self.devices valueForKey: uuid] writeValue:data
                                           forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
                
            }
        }
    }

}

- (IBAction)blink:(id)sender {
    int integer = 51;
    NSData *data = [[NSData alloc] initWithBytes:&integer length:sizeof(integer)];
    for (NSString * uuid in [self.devices keyEnumerator]) {
        for (CBService * service in [[self.devices valueForKey: uuid] services])
        {
            NSLog(@"%@", [[service UUID] UUIDString]);
            NSLog(@"%@", uuid);
            for (CBCharacteristic * characteristic in [service characteristics])
            {
                // NSLog(@"%@", uuid);
                //NSLog(@"%@", [[characteristic UUID] UUIDString]);
                [[self.devices valueForKey: uuid] writeValue:data
                                           forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
                
            }
        }
    }

}

- (IBAction)rainbow:(id)sender {
    int integer = 52;
    NSData *data = [[NSData alloc] initWithBytes:&integer length:sizeof(integer)];
    for (NSString * uuid in [self.devices keyEnumerator]) {
        for (CBService * service in [[self.devices valueForKey: uuid] services])
        {
            NSLog(@"%@", [[service UUID] UUIDString]);
            NSLog(@"%@", uuid);
            for (CBCharacteristic * characteristic in [service characteristics])
            {
                // NSLog(@"%@", uuid);
                //NSLog(@"%@", [[characteristic UUID] UUIDString]);
                [[self.devices valueForKey: uuid] writeValue:data
                                           forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
                
            }
        }
    }

}


- (IBAction)musicOn:(id)sender {
    int integer = 53;
    NSData *data = [[NSData alloc] initWithBytes:&integer length:sizeof(integer)];
    for (NSString * uuid in [self.devices keyEnumerator]) {
        for (CBService * service in [[self.devices valueForKey: uuid] services])
        {
            NSLog(@"%@", [[service UUID] UUIDString]);
            NSLog(@"%@", uuid);
            for (CBCharacteristic * characteristic in [service characteristics])
            {
                // NSLog(@"%@", uuid);
                //NSLog(@"%@", [[characteristic UUID] UUIDString]);
                [[self.devices valueForKey: uuid] writeValue:data
                                           forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
                
            }
        }
    }
}




- (IBAction)musicOff:(id)sender {
    int integer = 54;
    NSData *data = [[NSData alloc] initWithBytes:&integer length:sizeof(integer)];
    for (NSString * uuid in [self.devices keyEnumerator]) {
        for (CBService * service in [[self.devices valueForKey: uuid] services])
        {
            NSLog(@"%@", [[service UUID] UUIDString]);
            NSLog(@"%@", uuid);
            for (CBCharacteristic * characteristic in [service characteristics])
            {
                // NSLog(@"%@", uuid);
                //NSLog(@"%@", [[characteristic UUID] UUIDString]);
                [[self.devices valueForKey: uuid] writeValue:data
                                           forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
                
            }
        }
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)readRSSI
{
    CBPeripheral *thisPer = _selectedPeripheral;
    [thisPer readRSSI];
    
    int RSSI = [thisPer.RSSI intValue];
    return RSSI;
}

// Make sure iOS BT is on.  Then start scanning.
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    // You should test all scenarios
    if (central.state != CBCentralManagerStatePoweredOn) {
        // In case Bluetooth is off.
        return;
        // Need to add code here stating unable to access Bluetooth.
    }
    if (central.state == CBCentralManagerStatePoweredOn) {
        //If it's on, scan for devices.
        [_centralManager scanForPeripheralsWithServices:nil options:nil];
    }
    //NSLog(@"One  -- centralManagerDidUpdateState");
    //NSLog(@"One");
}

- (NSMutableDictionary *)devices
{
    // Make sure the device dictionary is empty.
    if (_devices == nil)
    {
        // Let's get the top 6 devices.
        _devices = [NSMutableDictionary dictionaryWithCapacity:100];
    }
    // Return a dictionary of devices.
    return _devices;
}

// Report what devices have been found.
- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData
                  RSSI:(NSNumber *)RSSI
{
    // Set peripheral.
    _discoveredPeripheral = peripheral;
    //NSLog(@"%@", [[peripheral identifier] UUIDString]);
    // Create a string for the conneceted peripheral.
    NSString * uuid = [[peripheral identifier] UUIDString];
    if (uuid) //Make sure we got the UUID.
    {
        //This sets the devices object.peripheral = uuid
        [self.devices setObject:peripheral forKey:uuid];
        [central connectPeripheral:_discoveredPeripheral options:nil];

    }
    //Refresh data in the table.
    //[self.tableView reloadData];
    
   // NSLog(@"centralManager didDiscoverPeripheral");
   // NSLog(@"Two -- centralManager didDiscoverPeripheral");
}

// Run this whenever we have connected to a device.
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
     //NSLog(@"%@", [[peripheral identifier] UUIDString]);
    // Set the peripheral delegate.
    peripheral.delegate = self;
    // Set the peripheral method's discoverServices to nil,
    // this searches for all services, its slower but inclusive.
    //if([[[peripheral identifier] UUIDString]  isEqual: @"558ED110-7B2F-4464-AA63-AF29819DC08"]) {
        [peripheral discoverServices:nil];
    //}
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    
        // Enumerate through all services on the connected peripheral.
    for (CBService * service in [peripheral services])
    {
        //NSLog(@"%@", [[peripheral identifier] UUIDString]);
        //NSLog(@"%@", [[service UUID]UUIDString]);
    
        // Discover all characteristics for this service.
        
        [peripheral discoverCharacteristics:nil forService:service];
    }
    
}

- (void)peripheral:(CBPeripheral *)peripheral
didDiscoverCharacteristicsForService:(CBService *)service
             error:(NSError *)error
{
    // Enumerate through all services on the connected peripheral.
    for (CBCharacteristic * character in [service characteristics])
    {
        
                // Discover all descriptors for each characteristic.
        [peripheral discoverDescriptorsForCharacteristic:character];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral
didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic
             error:(NSError *)error
{
    /*
    //Store data from the UUID in byte format, save in the bytes variable.
    const char * bytes =[(NSData*)[[characteristic UUID] data] bytes];
    //Check to see if it is two bytes long, and they are FF and E1.
    if (bytes && strlen(bytes) == 2 && bytes[0] == (char)255 && bytes[1] == (char)225)
    {
        // Send the peripheral data to the MainViewController.
        _selectedPeripheral = peripheral;
        for (CBService * service in [_selectedPeripheral services])
        {
            
            for (CBCharacteristic * characteristic in [service characteristics])
            {
                // For every characteristic on every service, on the connected peripheral
                // set the setNotifyValue to true.
               
                
                [_selectedPeripheral setNotifyValue:true forCharacteristic:characteristic];
            }
        }
    }
     */
    
}

- (void)sendValue:(NSData *) data
{
    for (CBService * service in [_selectedPeripheral services])
    {
        for (CBCharacteristic * characteristic in [service characteristics])
        {
            [_selectedPeripheral writeValue:data
            forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];

        }
    }
}

-(void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if (error) {
        NSLog(@"Error writing characteristic value: %@",
              [error localizedDescription]);
    }
}





@end
