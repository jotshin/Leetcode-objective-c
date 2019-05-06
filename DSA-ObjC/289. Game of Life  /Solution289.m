//
//  Solution289.m
//  DSA-ObjC
//
//  Created by Kai-Hong Tseng on 2019/5/5.
//  Copyright © 2019 jotshin. All rights reserved.
//

#import "Solution289.h"

@implementation Solution289

/*
 289. Game of Life -  initial state live (1) or dead (0)
 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 
 1-> <2 -> 0
 1-> =2 || =3 -> 1
 1-> >3 -> 0
 0-> =3 -> 1
 
 Input:
 [
 [0,1,0],
 [0,0,1],
 [1,1,1],
 [0,0,0]
 ]
 Output:
 [
 [0,0,0],
 [1,0,1],
 [0,1,1],
 [0,1,0]
 ]
 loop i for board.count (4)
 loop j for sub.count (3)
 livesAround = 0
 loop x, y in i-1 < x < i+1, j-1 < y < j+1
 if x < 0, y < 0, x < sub.count y < board.count
 if live then livesAround += 1
 
 if board[j][i] == 0 && livesAround == 2 || ==3 -> remains 1
 board[j][i] == 0 && livesAround -> becomes 1
 others -> 0
 
 log(NM) time constant space
 0 dead 1 live 2 go die 3 will live
 */

+ (void)gameOfLifeWithBoard:(NSMutableArray *)board {
    for (int j=0; j<board.count; j++) { {
        for (int i=0; i<((NSArray *)board.firstObject).count; i++)
            [self liveOrDie:board i:i j:j];
        }
    }
    [board enumerateObjectsUsingBlock:^(id  _Nonnull columnArray, NSUInteger idx, BOOL * _Nonnull stop) {
        [(NSArray *)columnArray enumerateObjectsUsingBlock:^(id  _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
            ((NSMutableArray *)columnArray)[idx] = [NSNumber numberWithInt:(((NSNumber *)cell).intValue % 2)];
        }];
    }];
}

+ (void)liveOrDie:(NSMutableArray *)board i:(int)i j:(int)j {
    int livesAround = 0;
    NSInteger columnBound = ((NSArray *)board.firstObject).count;
    NSInteger rowBound = board.count;
    for (int x=i-1; x<=i+1; x++) {
        for (int y=j-1; y<=j+1; y++) {
            if (x == i && y == j) {
                continue;
            }
            if (x < 0 || y < 0 || x > columnBound - 1 || y > rowBound - 1) {
                continue;
            }
            NSNumber *cell = board[y][x];
            // no need to count 0 dead or 3 will live
            if (cell.intValue == 1 || cell.intValue == 2) {
                livesAround++;
            }
        }
    }
    NSNumber *result = board[j][i];
    NSLog(@"%d", livesAround);
    if (result.intValue == 1) {
        if (livesAround < 2 || livesAround > 3) {
            board[j][i] = [NSNumber numberWithInt:2];
        } else {
            board[j][i] = [NSNumber numberWithInt:1];
        }
    } else if (result.intValue == 0 && livesAround == 3) {
        board[j][i] = [NSNumber numberWithInt:3];
    }
}

@end
