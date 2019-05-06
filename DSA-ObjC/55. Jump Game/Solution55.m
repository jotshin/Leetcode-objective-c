//
//  Solution55.m
//  DSA-ObjC
//
//  Created by Kai-Hong Tseng on 2019/5/6.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import "Solution55.h"

@implementation Solution55

/*
 Each element in the array represents your maximum jump length at that position.
 
 Determine if you are able to reach the last index.
 
 Input: [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 
 Input: [3,2,1,0,4]
 Output: false
 Explanation: You will always arrive at index 3 no matter what. Its maximum
 jump length is 0, which makes it impossible to reach the last index.
 
 wording: maximum
 last index
 
 [0] 2 x
 [1] + 3 v
 [2] + 1
 
 [0] +3 < 4 x
 [1] + 2 < 4 x
 [2] + 1 < 4 x
 [3] + 0 < 4 x
 
 recursive
 loop numbers
 if index + values >= lastIndex
 1index
 
 loop numbers
 if index + values >= 1index
 2 index
 
 if index + values >= 0
 almost linear time constant space
 */

+ (BOOL)canJumpWithNumbers:(NSArray *)numbers {
    return [self jump:numbers index:((NSNumber *)numbers[numbers.count-1]).integerValue] == 0 ? YES : NO;
}

+ (NSInteger)jump:(NSArray *)numbers index:(NSInteger)index {
    if (index == 0) {
        return 0;
    }
    for (NSInteger i=index-1; i>=0; i--) {
        if ((((NSNumber *)numbers[i]).integerValue + i) >= index) {
            return [self jump:numbers index:i];
        }
    }
    return -1;
}

@end
