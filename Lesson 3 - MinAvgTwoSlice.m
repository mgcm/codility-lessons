
int solution(NSMutableArray *A) {
    int N = [A count];
    float minAvg = ([A[0] intValue] + [A[1] intValue]) / 2.0;
    int minIdx = 0;

    for (int i = 1; i < N - 2; i++) {
        int sum = ([A[i] intValue] + [A[i + 1] intValue]);
        float avg = sum / 2.0;
        if (avg < minAvg) {
            minAvg = avg;
            minIdx = i;
        }
        
        sum += [A[i + 2] intValue];
        avg = (sum / 3.0);
        if (avg < minAvg) {
            minAvg = avg;
            minIdx = i;
        }
    }

    float avg = ([A[N - 2] intValue] + [A[N - 1] intValue]) / 2.0;
    if (avg < minAvg) {
        minAvg = avg;
        minIdx = N - 2;
    }
    
    return minIdx;
}
