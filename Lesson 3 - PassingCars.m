
int solution(NSMutableArray *A) {
    int currCount = 0;

    for (int i = [A count] - 1; i >= 0; i--) {
        currCount += [A[i] intValue];
        if ([A[i] isEqual:@0]) {
            A[i] = [NSNumber numberWithInt:currCount];
        } else {
            A[i] = @0;
        }
    }

    int result = 0;
    for (int i = 0 ; i < [A count]; i++) {
        result += [A[i] intValue];
    }

    if (result > 1000000000 || result < 0)
        return -1;

    return result;
}