int solution(int X, NSMutableArray *A) {
    NSMutableArray * C = [@[] mutableCopy];

    for (int i = 0; i <= X; i++) {
        [C addObject:@0];
    }

    int minJump = 1;
    for (int i = 0; i < [A count]; i ++) {
        int step = [A[i] intValue];
        C[step] = @1;

        bool canJump = true;
        for (int j = minJump; j <= X; j++) {
            if ([C[j] isEqual:@0]) {
                minJump = j;
                canJump = false;
                break;
            }
        }

        if (canJump) {
            return i;
        }
    }

    return -1;
}
