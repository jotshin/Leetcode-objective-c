//
//  main.m
//  DSA-ObjC
//
//  Created by Kai-Hong Tseng on 2019/5/2.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Solution289.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"result: %@", [Solution3 lengthOfLongestSubstring:@"pwwkew"]);
        NSMutableArray *row1 = [NSMutableArray arrayWithArray:@[@0,@1,@0]];
        NSMutableArray *row2 = [NSMutableArray arrayWithArray:@[@0,@0,@1]];
        NSMutableArray *row3 = [NSMutableArray arrayWithArray:@[@1,@1,@1]];
        NSMutableArray *row4 = [NSMutableArray arrayWithArray:@[@0,@0,@0]];
        NSMutableArray<NSMutableArray<NSNumber *> *> *array = [NSMutableArray arrayWithArray:@[
                                                                                               row1,
                                                                                               row2,
                                                                                               row3,
                                                                                               row4
                                                                                               ]];
        [Solution289 gameOfLifeWithBoard:array];
        NSLog(@"result: %@", array);
    }
    return 0;
}
