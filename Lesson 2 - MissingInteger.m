int solution(NSMutableArray *A) {
    NSMutableArray * positive = [@[] mutableCopy];
    int max = [A count];
    int minPositiveValue = INT32_MAX;

    for (int i = 0; i < [A count]; i++) {
        int value = [A[i] intValue];
        if (value > 0 && minPositiveValue > value) {
            minPositiveValue = value;
        }
    }

    if (minPositiveValue != 1) {
        return 1;
    }

    for (int i = 0; i <= max; i++) {
        [positive addObject:@0];
    }

    for (int i = 0; i < [A count]; i ++) {
        int value = [A[i] intValue];
        if (value >= 0 && value < [positive count]) {
            positive[value] = @1;
        }
    }

    for (int i = 1; i < [positive count]; i ++) {
        int value = [positive[i] intValue];
        if (value == 0) {
            return i;
        }
    }

    if (max > 0) {
        return max + 1;
    } else {
        return 1;
    }
}
