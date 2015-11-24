int solution(NSMutableArray *A) {
    if ([A count] == 0) {
        return 1;
    }

    NSMutableArray * flaggedNumbers = [[NSMutableArray alloc] initWithCapacity:[A count] + 1];
    for (int i = 0; i <= [A count]; i ++) {
        [flaggedNumbers addObject:@0];
    }

    for (int i = 0; i < [A count]; i ++) {
        int value = [A[i] intValue] - 1;
        flaggedNumbers[value] = @1;
    }
    NSLog(@"%@", flaggedNumbers);

    for (int i = 0; i < [A count]; i ++) {
        if (!([flaggedNumbers[i] isEqual:@1])) {
            return i + 1;
        }
    }

    return [A count] + 1;
}
