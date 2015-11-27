
#import <Foundation/Foundation.h>

NSMutableArray * solution(NSString *S, NSMutableArray *P, NSMutableArray *Q) {
    NSMutableArray * values = [@[] mutableCopy];
    NSMutableArray * results = [@[] mutableCopy];
    NSMutableDictionary * acgtCount = [@{@"1": [@[] mutableCopy], 
                                         @"2": [@[] mutableCopy],
                                         @"3": [@[] mutableCopy],
                                         @"4": [@[] mutableCopy]} mutableCopy];

    S = [S stringByReplacingOccurrencesOfString:@"A" withString:@"1"];
    S = [S stringByReplacingOccurrencesOfString:@"C" withString:@"2"];
    S = [S stringByReplacingOccurrencesOfString:@"G" withString:@"3"];
    S = [S stringByReplacingOccurrencesOfString:@"T" withString:@"4"];

    for (int j = 1; j <= 4; j++) {
        for (int i = 0; i < [S length]; i++) {
            NSMutableArray * positions = acgtCount[[NSString stringWithFormat:@"%i", j]];
            [positions addObject:@0];
        }
    }

    for (int i = 0; i < [S length]; i++) {
        NSString * ch = [S substringWithRange:NSMakeRange(i, 1)];
        NSMutableArray * positions = acgtCount[ch];
        positions[i] = @1;
        [values addObject:[NSNumber numberWithInt:[ch intValue]]];
    }

    for (int j = 1; j <= 4; j++) {
        for (int i = 1; i < [S length]; i++) {
            NSMutableArray * positions = acgtCount[[NSString stringWithFormat:@"%i", j]];
            positions[i] = [NSNumber numberWithInt:[positions[i] intValue] + [positions[i-1] intValue]];
        }
    }

    for (int i = 0; i < [P count] ; i++) {
        int p = [P[i] intValue];
        int q = [Q[i] intValue];

        int tmpIdx = 0;
        for (int j = 1; j <= 4; j++) {
            NSMutableArray * positions = acgtCount[[NSString stringWithFormat:@"%i", j]];
            int qValue = [positions[q] intValue];
            int pValue = [positions[p] intValue];
            if (p == q && qValue > 0) {
                tmpIdx = j;
            }

            if (qValue - pValue > 0) {
                [results addObject:[NSNumber numberWithInt:j]];
                break;
            }
        }
        
        if (tmpIdx > 0) {
            [results addObject:[NSNumber numberWithInt:tmpIdx]];
        }
    }

    return results;
}