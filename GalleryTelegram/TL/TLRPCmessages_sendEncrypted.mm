#import "TLRPCmessages_sendEncrypted.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"

#import "TLInputEncryptedChat.h"
#import "TLInputEncryptedFile.h"
#import "TLmessages_SentEncryptedMessage.h"

@implementation TLRPCmessages_sendEncrypted

@synthesize peer = _peer;
@synthesize random_id = _random_id;
@synthesize data = _data;
@synthesize file = _file;

- (Class)responseClass
{
    return [TLmessages_SentEncryptedMessage class];
}

- (int)impliedResponseSignature
{
    return (int)0x560f8935;
}

- (int)layerVersion
{
    return 8;
}

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

@implementation TLRPCmessages_sendEncrypted$messages_sendEncrypted : TLRPCmessages_sendEncrypted


- (int32_t)TLconstructorSignature
{
    return (int32_t)0xb173c6fc;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x9253fb1b;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLRPCmessages_sendEncrypted$messages_sendEncrypted *object = [[TLRPCmessages_sendEncrypted$messages_sendEncrypted alloc] init];
    object.peer = metaObject->getObject(0x9344c37d);
    object.random_id = metaObject->getInt64(0xca5a160a);
    object.data = metaObject->getBytes(0xa361765d);
    object.file = metaObject->getObject(0x3187ec9);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.peer;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x9344c37d, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt64;
        value.primitive.int64Value = self.random_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xca5a160a, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.data;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xa361765d, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.file;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x3187ec9, value));
    }
}


@end

