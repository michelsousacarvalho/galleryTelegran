#import "TLChatParticipant.h"

#import "NSInputStream+TL.h"
#import "NSOutputStream+TL.h"


@implementation TLChatParticipant

@synthesize user_id = _user_id;
@synthesize inviter_id = _inviter_id;
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

@implementation TLChatParticipant$chatParticipant : TLChatParticipant


- (int32_t)TLconstructorSignature
{
    return (int32_t)0xc8d7493e;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0xbb7c75d2;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)metaObject
{
    TLChatParticipant$chatParticipant *object = [[TLChatParticipant$chatParticipant alloc] init];
    object.user_id = metaObject->getInt32(0xafdf4073);
    object.inviter_id = metaObject->getInt32(0x9ddfbd93);
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
        value.primitive.int32Value = self.inviter_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x9ddfbd93, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.date;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xb76958ba, value));
    }
}


@end

