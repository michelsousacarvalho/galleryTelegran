#import "TLSet_client_DH_params_answer.h"

#import "../NSInputStream+TL.h"
#import "../NSOutputStream+TL.h"


@implementation TLSet_client_DH_params_answer

@synthesize nonce = _nonce;
@synthesize server_nonce = _server_nonce;

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

@implementation TLSet_client_DH_params_answer$dh_gen_ok : TLSet_client_DH_params_answer

@synthesize n_new_nonce_hash1 = _n_new_nonce_hash1;

- (int32_t)TLconstructorSignature
{
    return (int32_t)0x3bcbf734;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x77aac145;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLSet_client_DH_params_answer$dh_gen_ok *object = [[TLSet_client_DH_params_answer$dh_gen_ok alloc] init];
    object.nonce = metaObject->getBytes(0x48cbe731);
    object.server_nonce = metaObject->getBytes(0xe1dc3f2c);
    object.n_new_nonce_hash1 = metaObject->getBytes(0x5149dd75);
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
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.n_new_nonce_hash1;
        values->insert(std::pair<int32_t, TLConstructedValue>(0x5149dd75, value));
    }
}


@end

@implementation TLSet_client_DH_params_answer$dh_gen_retry : TLSet_client_DH_params_answer

@synthesize n_new_nonce_hash2 = _n_new_nonce_hash2;

- (int32_t)TLconstructorSignature
{
    return (int32_t)0x46dc1fb9;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x9aa19bbd;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLSet_client_DH_params_answer$dh_gen_retry *object = [[TLSet_client_DH_params_answer$dh_gen_retry alloc] init];
    object.nonce = metaObject->getBytes(0x48cbe731);
    object.server_nonce = metaObject->getBytes(0xe1dc3f2c);
    object.n_new_nonce_hash2 = metaObject->getBytes(0xd88ed2a1);
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
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.n_new_nonce_hash2;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xd88ed2a1, value));
    }
}


@end

@implementation TLSet_client_DH_params_answer$dh_gen_fail : TLSet_client_DH_params_answer

@synthesize n_new_nonce_hash3 = _n_new_nonce_hash3;

- (int32_t)TLconstructorSignature
{
    return (int32_t)0xa69dae02;
}

- (int32_t)TLconstructorName
{
    return (int32_t)0x155d9cb0;
}

- (id<TLObject>)TLbuildFromMetaObject:(std::tr1::shared_ptr<TLMetaObject>)metaObject
{
    TLSet_client_DH_params_answer$dh_gen_fail *object = [[TLSet_client_DH_params_answer$dh_gen_fail alloc] init];
    object.nonce = metaObject->getBytes(0x48cbe731);
    object.server_nonce = metaObject->getBytes(0xe1dc3f2c);
    object.n_new_nonce_hash3 = metaObject->getBytes(0xac955c3f);
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
        value.type = TLConstructedValueTypeBytes;
        value.nativeObject = self.n_new_nonce_hash3;
        values->insert(std::pair<int32_t, TLConstructedValue>(0xac955c3f, value));
    }
}


@end

