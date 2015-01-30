#import "TLPeer.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"


@implementation TLPeer


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

@implementation TLPeer$peerUser : TLPeer

@synthesize user_id = _user_id;

- (int32_t)TLconstructorSignature
{
    return (int32_t)0x9db1bc6d;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0xceb751ba;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLPeer$peerUser *object = [[TLPeer$peerUser alloc] init];
    object.user_id = metaObject->getInt32(0xafdf4073);
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
}


@end

@implementation TLPeer$peerChat : TLPeer

@synthesize chat_id = _chat_id;

- (int32_t)TLconstructorSignature
{
    return (int32_t)0xbad0e5bb;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x6d0b2f31;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLPeer$peerChat *object = [[TLPeer$peerChat alloc] init];
    object.chat_id = metaObject->getInt32(0x7234457c);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.chat_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x7234457c, value));
    }
}


@end

