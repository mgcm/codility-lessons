int solution(int X, int Y, int D) {
    double steps = (Y - X) / (double) D;

    int reminder = (Y - X) % D;

    if (reminder > 0) {
        steps += 1;
    }

    return (int)steps;
}
