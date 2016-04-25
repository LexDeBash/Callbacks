//
//  Logger.m
//  Callbacks
//
//  Created by Alexey Efimov on 25.04.16.
//  Copyright © 2016 Alexey Efimov. All rights reserved.
//

#import "Logger.h"

@implementation Logger
- (void)sayOush:(NSTimer *)t {
    NSLog(@"Ouch!");
}

// Вызывается при каждом получении блока данных
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"received %lu bytes", [data length]);
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    [incomingData appendData:data];
}

// Вызывается при обработке последнего блока
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:incomingData
                                             encoding:NSUTF8StringEncoding];
    incomingData = nil;
    NSLog(@"The whole string is %@", string);
}
// Вызывается в случае ошибки при загрузке данных
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection failed: %@", [error localizedDescription]);
    incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has change!");
}
@end
