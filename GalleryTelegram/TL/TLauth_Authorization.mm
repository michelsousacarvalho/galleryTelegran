#import "TLauth_Authorization.h"

#import "NSInputStream+TL.h"
#import "NSOutputStream+TL.h"

#import "TLUser.h"

@implementation TLauth_Authorization

@synthesize expires = _expires;
@synthesize user = _user;

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

@implementation TLauth_Authorization$auth_authorization : TLauth_Authorization


- (int32_t)TLconstructorSignature
{
    return (int32_t)0xf6b673a4;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0xbe42bc34;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)metaObject
{
    TLauth_Authorization$auth_authorization *object = [[TLauth_Authorization$auth_authorization alloc] init];
    object.expires = metaObject->getInt32(0x4743fb6b);
    object.user = metaObject->getObject(0x2275eda7);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.expires;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x4743fb6b, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeObject;
        value.nativeObject = self.user;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x2275eda7, value));
    }
}


@end

