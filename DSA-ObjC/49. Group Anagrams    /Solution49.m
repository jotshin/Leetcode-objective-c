//
//  Solution.m
//  DSA
//
//  Created by Kai-Hong Tseng on 2019/5/1.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import "Solution49.h"

@implementation Solution49

/*
 49 Group Anagrams    
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 

 dic = [Set: NSMutableArray]
 
 loop input
 make it set Set = @{@"e", @"a"}
 check dic -> append or create
 
 return dic.values
 */

+ (NSArray *)groupAnagramsWithString:(NSArray<NSString *> *)strings {
    NSMutableDictionary<NSCharacterSet *, NSMutableArray *> *dic = [NSMutableDictionary new];
    for (NSString *anagram in strings) {
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:anagram];
        if (dic[set] == nil) {
            NSMutableArray *array = [NSMutableArray new];
            dic[set] = array;            
        }
        [(NSMutableArray *)dic[set] addObject:anagram];
    }
    return dic.allValues;
}

// two integers, print all odd numbers between them (inclusive)
+ (NSArray<NSNumber *> *)oddNumbersBetween:(NSNumber *)i j:(NSNumber *)j {
    NSMutableArray *array = [NSMutableArray new];
    for (int x = i.intValue%2 ? (i.integerValue + 1.0) : i.intValue; x <= j.intValue; x+=2) {
        [array addObject:[NSNumber numberWithInt:x]];
    }
    return array;
}

//unsorted array to find k
// n log(n)
+ (NSString *)findNumber:(NSArray *)arr k:(NSNumber *)k {
    
    NSMutableArray *sortedArray = (NSMutableArray *)[arr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *a = obj1;
        NSNumber *b = obj2;
        return [a compare:b]; // NSOrder
    }];
    
    int mid = (int)sortedArray.count/2;
    int left = 0;
    int right = (int)sortedArray.count - 1;
    
    while (right > 0 && left < (sortedArray.count - 1)) {
        if (k.intValue < mid) {
            right = mid - 1;
        } else if (k.intValue > mid) {
            left = mid + 1;
        } else {
            return @"YES";
        }
    }
    
    return @"NO";
}

@end
