//
//  main.m
//  Callbacks
//
//  Created by Alexey Efimov on 25.04.16.
//  Copyright © 2016 Alexey Efimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Logger.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Logger *logger = [[Logger alloc] init];
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                          target:logger
                                                        selector:@selector(sayOush:)
                                                        userInfo:nil
                                                         repeats:YES];
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
