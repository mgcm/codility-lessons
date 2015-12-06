// NOTE: not passing 100%

int solution(NSMutableArray *A) {
    int N = [A count];
    int count = 0;
    int minValue = 0;
    int maxValue = 0;

    for (int i = 0; i < N; i++) {
        int radius = [A[i] intValue];

        int minPos = i - radius;
        int maxPos = i + radius;
        if (minValue > minPos) {
            minValue = minPos;
        }
        if (maxValue < maxPos) {
            maxValue = maxPos;
        }
    }
    
    NSMutableArray * positionCount = [@[] mutableCopy];
    for (int i = 0; i <= (maxValue - minValue); i++) {
        [positionCount addObject:@0];
    }

    for (int i = 0; i < N; i++) {
        int radius = [A[i] intValue];
        int minPos = i - radius;
        int maxPos = i + radius;
        
        for (int j = minPos; j <= maxPos; j++) {
            int idx = j - minValue;
            positionCount[idx] = [NSNumber numberWithInt:[positionCount[idx] intValue] + 1];
        }
    }
    
    id currValue = positionCount[0];
    for (int i = 0; i < [positionCount count] - 1; i++) {
        if ([positionCount[i+1] isEqual:currValue]) {
            positionCount[i+1] = @0;
        } else {
            currValue = positionCount[i+1];
        }
        
        if ([positionCount[i] isEqual:@1]) {
            positionCount[i] = @0;
        }
        if ([positionCount[i+1] isEqual:@1]) {
            positionCount[i+1] = @0;
        }
    }
    NSLog(@"%@ %i", positionCount, count);

    if (count > 10000000) {
        count = -1;
    }

    for (int i = 0; i < [positionCount count] - 1; i++) {
        count += [positionCount[i] intValue];
    }

    return count;
}