
@interface NSStack: NSObject

@property (strong, nonatomic) NSMutableArray * array;

- (void)push:(id)elem;
- (id)peek;
- (id)pop;

@end

@implementation NSStack

- (id)init {
    if (self = [super init]) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)push:(id)elem {
    [_array addObject:elem];
}

- (id)peek
{
    NSUInteger len = [_array count];
    if (len > 0) {
        id elem = [_array objectAtIndex:len - 1];
        return elem;
    } else {
        return nil;
    }
}

- (id)pop
{
    NSUInteger len = [_array count];
    if (len > 0) {
        id elem = [_array objectAtIndex:len - 1];
        [_array removeLastObject];
        return elem;
    } else {
        return nil;
    }
}

- (NSUInteger)size
{
    return [_array count];
}

- (NSString *)description
{
    return [_array description];
}


@end


int solution(NSMutableArray *H) {
    NSStack * stack = [[NSStack alloc] init];
    NSUInteger blocks = 0;

    for (int i = 0; i < [H count]; i++) {
        NSUInteger height = [H[i] intValue];

        while ([stack size] > 0 && [[stack peek] intValue] > height) {
            [stack pop];    
        }

        if ([[stack peek] intValue] != height) {
            [stack push:H[i]];
            blocks ++;
        }
    }
    
    return blocks;
}