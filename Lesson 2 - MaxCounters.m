int max = 0;
int highest = 0;

void incC(NSMutableArray * a, int counter) {
    int newValue = [a[counter - 1] intValue] + 1;

    if (newValue <= max) {
        newValue = max + 1;
    }

    if (newValue > highest) {
        highest = newValue;
    }

    a[counter - 1] = [NSNumber numberWithInt:newValue];
}

NSMutableArray * solution(int N, NSMutableArray *A) {
    NSMutableArray * counters = [@[] mutableCopy];

    NSLog(@"%i, %@", N, A);

    for (int i = 0; i < N; i++) {
        [counters addObject:@0];
    }

    for (int i = 0; i < [A count]; i++) {
        int value = [A[i] intValue];
        if (value <= N) {
            incC(counters, value);
        } else if (value == N+1) {
            max = highest;
        }
    }

    for (int i = 0; i < [counters count]; i++) {
        int value = [counters[i] intValue];
        if (value < max) {
            counters[i] = [NSNumber numberWithInt:max];
        }
    }

    return counters;
}

