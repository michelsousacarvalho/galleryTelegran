#import "TLEncryptedMessage.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"

#import "TLEncryptedFile.h"

@implementation TLEncryptedMessage

@synthesize random_id = _random_id;
@synthesize chat_id = _chat_id;
@synthesize date = _date;
@synthesize bytes = _bytes;
@synthesize file = _file;

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

@implementation TLEncryptedMessage$encryptedMessage : TLEncryptedMessage


- (int32_t)TLconstructorSignature
{
    return (int32_t)0xed18c118;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0xc086c3a7;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLEncryptedMessage$encryptedMessage *object = [[TLEncryptedMessage$encryptedMessage alloc] init];
    object.random_id = metaObject->getInt64(0xca5a160a);
    object.chat_id = metaObject->getInt32(0x7234457c);
    object.date = metaObject->getInt32(0xb76958ba);
    object.bytes = metaObject->getBytes(0xec5ef20a);
    object.file = metaObject->getObject(0x3187ec9);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt64;
        value.primitive.int64Value = self.random_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xca5a160a, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.chat_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x7234457c, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.date;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xb76958ba, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.bytes;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xec5ef20a, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.file;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x3187ec9, value));
    }
}


@end

