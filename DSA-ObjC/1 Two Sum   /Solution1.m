//
//  Solution1.m
//  DSA
//
//  Created by Kai-Hong Tseng on 2019/5/2.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import "Solution1.h"

@implementation Solution1

/*
 1 Two Sum
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 
 loop nums
 deducing 9 to see if it matches key
 save to dic -> number: index
 if matching a key
 9-2 = 7
 2 0
 no
 
 9-7 = 2
 7 1
 yes
 
 11 2
 15 3

 return [0, 1]
 linear time, linear space
 */

+ (NSArray *)sumOfNumbersFromNumbers:(NSArray<NSNumber *> *)numbers target:(NSNumber *)target {
    
    NSMutableDictionary<NSNumber *, NSNumber *> *dic = [NSMutableDictionary new];
    for (NSInteger i=0; i < numbers.count; i++) {
        NSNumber *diff = [NSNumber numberWithInteger:(target.integerValue - numbers[i].integerValue)];
        if (dic[diff]) {
            return @[dic[diff], [NSNumber numberWithInteger:i]];
        }
        dic[numbers[i]] = [NSNumber numberWithInteger:i];
    }
    return @[];
}

@end
