#import "TLContactBlocked.h"

#import "NSInputStream+TL.h"
#import "NSOutputStream+TL.h"


@implementation TLContactBlocked

@synthesize user_id = _user_id;
@synthesize date = _date;

- (int32_t)TLconstructorSignature
{
    NSLog(@"constructorSignature is not implemented for base type");
    return 0;
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


@end

@implementation TLContactBlocked$contactBlocked : TLContactBlocked


- (int32_t)TLconstructorSignature
{
    return (int32_t)0x561bc879;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0xb5c6722b;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)metaObject
{
    TLContactBlocked$contactBlocked *object = [[TLContactBlocked$contactBlocked alloc] init];
    object.user_id = metaObject->getInt32(0xafdf4073);
    object.date = metaObject->getInt32(0xb76958ba);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.user_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xafdf4073, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.date;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xb76958ba, value));
    }
}


@end

