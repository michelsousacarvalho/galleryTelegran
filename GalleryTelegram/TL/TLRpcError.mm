#import "TLRpcError.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"


@implementation TLRpcError

@synthesize error_code = _error_code;
@synthesize error_message = _error_message;

- (int32_t)TLconstructorSignature
{
    TGLog(@"constructorSignature is not implemented for base type");
    return 0;
}

- (int32_t)TLconstructorName
{
    TGLog(@"constructorName is not implemented for base type");
    return 0;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)__unused metaObject
{
    TGLog(@"TLbuildFromMetaObject is not implemented for base type");
    return nil;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)__unused values
{
    TGLog(@"TLfillFieldsWithValues is not implemented for base type");
}


@end

@implementation TLRpcError$rpc_error : TLRpcError


- (int32_t)TLconstructorSignature
{
    return (int32_t)0x2144ca19;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x18d9115d;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLRpcError$rpc_error *object = [[TLRpcError$rpc_error alloc] init];
    object.error_code = metaObject->getInt32(0xd1591cb4);
    object.error_message = metaObject->getString(0xabd7b4c9);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.error_code;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xd1591cb4, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeString;
        value.nativeObject = self.error_message;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xabd7b4c9, value));
    }
}


@end

@implementation TLRpcError$rpc_req_error : TLRpcError

@synthesize query_id = _query_id;

- (int32_t)TLconstructorSignature
{
    return (int32_t)0x7ae432f5;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x877ecca3;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLRpcError$rpc_req_error *object = [[TLRpcError$rpc_req_error alloc] init];
    object.query_id = metaObject->getInt64(0x4536add4);
    object.error_code = metaObject->getInt32(0xd1591cb4);
    object.error_message = metaObject->getString(0xabd7b4c9);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt64;
        value.primitive.int64Value = self.query_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x4536add4, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.error_code;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xd1591cb4, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeString;
        value.nativeObject = self.error_message;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xabd7b4c9, value));
    }
}


@end

