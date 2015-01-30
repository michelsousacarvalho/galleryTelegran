#import "NSArray_GeoChatMessage.h"

#import "NSInputStream+TL.h"
#import "NSOutputStream+TL.h"


@implementation NSArray_GeoChatMessage


- (int32_t)TLconstructorSignature
{
    return (int32_t)0x7289c6b7;
}

- (int32_t)TLconstructorName
{
    NSLog(@"constructorName is not implemented for base type");
    return 0;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)__unused metaObject
{
    NSLog(@"TLbuildFromMetaObject is not implemented for base type");
    return nil;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)__unused values
{
    NSLog(@"TLfillFieldsWithValues is not implemented for base type");
}

- (id)TLvectorConstruct
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array TLtagConstructorName:(int32_t)0x7289c6b7];
    return array;
}


@end

