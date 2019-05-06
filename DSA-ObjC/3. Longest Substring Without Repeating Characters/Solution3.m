//
//  Solution3.m
//  DSA-ObjC
//
//  Created by Kai-Hong Tseng on 2019/5/4.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import "Solution3.h"

@implementation Solution3
/*
 3 Longest Substring Without Repeating Characters
 Given a string, find the length of the longest substring without repeating characters.
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.

 Input: "pwwkew"
 Output: 3
 
 0 p:1 lo=1 temp=1
 1 p:1, w:1 lo=2 temp=2
 2 exists w p:0, w:1, lo=2 temp=1
 3 exists w p:0, w:1 lo=2 temp=0
 3 p:0, w:0, k:1 lo=2 temp=1
 4 exists a:1, b:1, c:1 lo=3 left=2
 */

//+ (NSNumber *)lengthOfLongestSubstring:(NSString *)string {
//    NSMutableDictionary<NSString *, NSNumber *> *dic = [NSMutableDictionary new];
//    int longest = 0;
//    int left = 0;
//    int right = 0;
//    int temp = 0;
//    while (right < string.length) {
//        NSString *rightChar = [NSString stringWithFormat:@"%C", [string characterAtIndex:right]];
//        if (!dic[rightChar] || dic[rightChar].intValue == 0) {
//            temp++;
//            NSLog(@"%d", temp);
//            longest = temp > longest ? temp : longest;
//            dic[rightChar] = [NSNumber numberWithInt:1];
//            right++;
//        } else {
//            NSString *leftChar = [NSString stringWithFormat:@"%C", [string characterAtIndex:left]];
//            int result = dic[leftChar].intValue - 1;
//            dic[leftChar] = [NSNumber numberWithInt:result];
//            temp--;
//            NSLog(@"%d", temp);
//            left++;
//        }
//    }
//    return [NSNumber numberWithInt:longest];
//}

/*
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 
 Input: "pwwkew"
 Output: 3
 
 0 p:1 lo=1 temp=1
 1 p:1, w:1 lo=2 temp=2
 2 exists w p:0, w:2, right=2
 3 exists w p:0, w:1 lo=2 temp=0

 */

+ (NSNumber *)lengthOfLongestSubstring:(NSString *)string {
    int longest = 0;
    NSMutableDictionary<NSString *, NSNumber *> *dic = [NSMutableDictionary new];
    for (int right = 0, left = 0; right < string.length; right++) {
        NSString *rightChar = [NSString stringWithFormat:@"%C", [string characterAtIndex:right]];
        if (dic[rightChar]) {
            left = MAX(dic[rightChar].intValue, right);
        }
        longest = MAX(longest, right - left + 1);
        dic[rightChar] = [NSNumber numberWithInt:(right + 1)];
    }
    return [NSNumber numberWithInt:longest];
}


@end
