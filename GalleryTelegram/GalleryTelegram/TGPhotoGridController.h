/*
 * This is the source code of Telegram for iOS v. 1.1
 * It is licensed under GNU GPL v. 2 or later.
 * You should have received a copy of the license in this archive (see LICENSE).
 *
 * Copyright Peter Iakovlev, 2013.
 */

#import "TGViewController.h"
#import "TGMidia.h"
#import "TGActionTableView.h"
#import "TGPhotoGridCell.h"

@interface TGPhotoGridController : TGViewController <TGViewControllerNavigationBarAppearance, TGPhotoGridCellDelegate>

//@property (nonatomic, strong) ASHandle *actionHandle;
@property (nonatomic, strong) NSMutableArray *midias;


//- (id)initWithConversationId:(int64_t)conversationId isEncrypted:(bool)isEncrypted;
- (void)actionStageActionRequested:(NSString *)action options:(NSDictionary *)options;
@end
