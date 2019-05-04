//
//  Solution20.m
//  DSA-ObjC
//
//  Created by Kai-Hong Tseng on 2019/5/4.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import "Solution20.h"

@implementation Solution20

+ (BOOL)isValidString:(NSString *)string {
    /*
     20. Valid Parentheses    
     An input string is valid if:
     
     Open brackets must be closed by the same type of brackets.
     Open brackets must be closed in the correct order.
     Note that an empty string is also considered valid.
     
     Input: "()[]{}"
     Output: true
     
     Input: "([)]"
     Output: false
     
     Input: "{[]}"
     Output: true
     
     var array:[Char]
     loop string
     if open symbol
     append it in array
     if it's close, it has to match and removed from array, otherwise fail
     linear time, constant space
     */
    
    NSMutableArray<NSString *> *array = [NSMutableArray new];
    for (NSInteger i=0; i < string.length; i++) {
        NSString *currentString = [string substringWithRange:NSMakeRange(i, 1)];
        if ([currentString isEqualToString:@"("] || [currentString isEqualToString:@"{"] || [currentString isEqualToString:@"["]) {
            [array addObject:currentString];
        } else {
            if (array.count == 0) {
                return NO;
            }
            if ([currentString isEqualToString:@")"]) {
                if ([array.lastObject isEqualToString:@"("]) {
                    [array removeLastObject];
                } else {
                    return NO;
                }
            } else if ([currentString isEqualToString:@"}"]) {
                if ([array.lastObject isEqualToString:@"{"]) {
                    [array removeLastObject];
                } else {
                    return NO;
                }
            } else if ([currentString isEqualToString:@"]"]) {
                if ([array.lastObject isEqualToString:@"["]) {
                    [array removeLastObject];
                } else {
                    return NO;
                }
            }
        }
    }
    return YES;
}

@end
