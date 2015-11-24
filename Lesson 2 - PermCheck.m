int solution(NSMutableArray *A) {
    NSMutableArray * C = [@[] mutableCopy];
    int N = 0;

    for (int i = 0; i < [A count]; i++) {
        int value = [A[i] intValue];
        if (value > N) {
            N = value;
        }
    }

    if ([A count] < N) {
        return 0;
    }

    for (int i = 0; i < N; i++) {
        [C addObject:@0];
    }

    for (int i = 0; i < [A count]; i ++) {
        int step = [A[i] intValue] - 1;
        int value = [C[step] intValue] + 1;
        if (value > 1) {
            return 0;
        }
        C[step] = [NSNumber numberWithInt:value];
    }

    for (int i = 0; i < [C count]; i ++) {
        int value = [C[i] intValue];
        if (value == 0) {
            return 0;
        }
    }

    return 1;
}
