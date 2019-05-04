//
//  main.m
//  DSA-ObjC
//
//  Created by Kai-Hong Tseng on 2019/5/2.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Solution1.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%@", [Solution1 sumOfNumbersFromNumbers:@[@2, @7, @11, @15] target:@17]);
    }
    return 0;
}
