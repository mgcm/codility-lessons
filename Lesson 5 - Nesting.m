
int solution(NSString *S) {
	int stackLen = 0;

    for (NSUInteger i = 0; i < [S length]; i ++) {
        unichar c = [S characterAtIndex:i];
        if (c == 40 && stackLen >= 0) {
            stackLen ++;
        } else if (c == 41) {
            stackLen --;
        }
    }

    return stackLen == 0;
}