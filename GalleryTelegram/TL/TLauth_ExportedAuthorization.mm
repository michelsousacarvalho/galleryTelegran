#import "TLauth_ExportedAuthorization.h"

#import "NSInputStream+TL.h"
#import "NSOutputStream+TL.h"


@implementation TLauth_ExportedAuthorization

@synthesize n_id = _n_id;
@synthesize bytes = _bytes;

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

@implementation TLauth_ExportedAuthorization$auth_exportedAuthorization : TLauth_ExportedAuthorization


- (int32_t)TLconstructorSignature
{
    return (int32_t)0xdf969c2d;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x7bed2cb4;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::shared_ptr<TLMetaObject>)metaObject
{
    TLauth_ExportedAuthorization$auth_exportedAuthorization *object = [[TLauth_ExportedAuthorization$auth_exportedAuthorization alloc] init];
    object.n_id = metaObject->getInt32(0x7a5601fb);
    object.bytes = metaObject->getBytes(0xec5ef20a);
    return object;
}

- (void)TLfillFieldsWithValues:(std::map<int32_t, TLConstructedValue> *)values
{
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypePrimitiveInt32;
        value.primitive.int32Value = self.n_id;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x7a5601fb, value));
    }
    {
        TLConstructedValue value;
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.bytes;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xec5ef20a, value));
    }
}


@end

