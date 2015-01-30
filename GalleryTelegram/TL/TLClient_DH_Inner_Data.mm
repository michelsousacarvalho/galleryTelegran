#import "TLClient_DH_Inner_Data.h"

#import "NSInputStream+TL.h"
#import "NSOutputStream+TL.h"


@implementation TLClient_DH_Inner_Data

@synthesize nonce = _nonce;
@synthesize server_nonce = _server_nonce;
@synthesize retry_id = _retry_id;
@synthesize g_b = _g_b;

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

@implementation TLClient_DH_Inner_Data$client_DH_inner_data : TLClient_DH_Inner_Data


- (int32_t)TLconstructorSignature
{
    return (int32_t)0x6643b654;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x4199e5da;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)metaObject
{
    TLClient_DH_Inner_Data$client_DH_inner_data *object = [[TLClient_DH_Inner_Data$client_DH_inner_data alloc] init];
    object.nonce = metaObject->getBytes(0x48cbe731);
    object.server_nonce = metaObject->getBytes(0xe1dc3f2c);
    object.retry_id = metaObject->getInt64(0xffcbff73);
    object.g_b = metaObject->getBytes(0x5643e234);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.nonce;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x48cbe731, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.server_nonce;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xe1dc3f2c, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt64;
        value.primitive.int64Value = self.retry_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xffcbff73, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.g_b;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x5643e234, value));
    }
}


@end

