#import "TLConfig.h"

#import "NSInputStream+TL.h"
#import "NSOutputStream+TL.h"


@implementation TLConfig

@synthesize date = _date;
@synthesize test_mode = _test_mode;
@synthesize this_dc = _this_dc;
@synthesize dc_options = _dc_options;
@synthesize chat_size_max = _chat_size_max;

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

@implementation TLConfig$config : TLConfig


- (int32_t)TLconstructorSignature
{
    return (int32_t)0x232d5905;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x9167d250;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)metaObject
{
    TLConfig$config *object = [[TLConfig$config alloc] init];
    object.date = metaObject->getInt32(0xb76958ba);
    object.test_mode = metaObject->getBool(0x1288ca35);
    object.this_dc = metaObject->getInt32(0x1b29ec36);
    object.dc_options = metaObject->getArray(0x25e6c768);
    object.chat_size_max = metaObject->getInt32(0x95174295);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.date;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xb76958ba, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveBool;
        value.primitive.boolValue = self.test_mode;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x1288ca35, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.this_dc;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x1b29ec36, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeVector;
        value.nativeObject = self.dc_options;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x25e6c768, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.chat_size_max;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x95174295, value));
    }
}


@end

