//
//  main.m
//  DSA-ObjC
//
//  Created by Kai-Hong Tseng on 2019/5/2.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Solution55.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"result: %@", [Solution3 lengthOfLongestSubstring:@"pwwkew"]);

        NSLog(@"result: %@", [Solution55 canJumpWithNumbers:@[@1,@1,@1,@1,@1,@1,@1,@1,@1,@1]] ? @"YES" : @"NO");
    }
    return 0;
}
