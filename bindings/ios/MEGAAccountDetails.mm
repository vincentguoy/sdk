//
//  MEGAAcountDetails.m
//
//  Created by Javier Navarro on 02/10/14.
//  Copyright (c) 2014 MEGA. All rights reserved.
//

#import "MEGAAccountDetails.h"
#import "megaapi.h"

using namespace mega;

@interface MEGAAcountDetails ()

- (instancetype)initWithMegaAccountDetails:(MegaAccountDetails *)accountDetails cMemoryOwn:(BOOL)cMemoryOwn;
- (MegaAccountDetails *)getCPtr;

@property MegaAccountDetails *accountDetails;
@property BOOL cMemoryOwn;

@end

@implementation MEGAAcountDetails

- (instancetype)initWithMegaAccountDetails:(MegaAccountDetails *)accountDetails cMemoryOwn:(BOOL)cMemoryOwn {
    self = [super init];
    
    if (self != nil){
        _accountDetails = accountDetails;
        _cMemoryOwn = cMemoryOwn;
    }
    
    return self;
}

- (void)dealloc {
    if (self.cMemoryOwn) {
        delete _accountDetails;
    }
}

- (MegaAccountDetails *)getCPtr {
    return self.accountDetails;
}

- (NSNumber *)storageUsed {
    return self.accountDetails ? [[NSNumber alloc] initWithLongLong:self.accountDetails->getStorageUsed()] : nil;
}

- (NSNumber *)storageMax {
    return self.accountDetails ? [[NSNumber alloc] initWithLongLong:self.accountDetails->getStorageMax()] : nil;
}

- (NSNumber *)transferOwnUsed {
    return self.accountDetails ? [[NSNumber alloc] initWithLongLong:self.accountDetails->getTransferOwnUsed()] : nil;
}

- (NSNumber *)transferMax {
    return self.accountDetails ? [[NSNumber alloc] initWithLongLong:self.accountDetails->getTransferMax()] : nil;
}

- (MEGAAccountType)type {
    return (MEGAAccountType) (self.accountDetails ? self.accountDetails->getProLevel() : 0);
}

- (NSNumber *)storageUsedWithHandle:(uint64_t)handle {
    return self.accountDetails ? [[NSNumber alloc] initWithLongLong:self.accountDetails->getStorageUsed(handle)] : nil;
}

- (NSNumber *)numberFilesWithHandle:(uint64_t)handle {
    return self.accountDetails ? [[NSNumber alloc] initWithLongLong:self.accountDetails->getNumFiles(handle)] : nil;
}

- (NSNumber *)numberFoldersWithHandle:(uint64_t)handle {
    return self.accountDetails ? [[NSNumber alloc] initWithLongLong:self.accountDetails->getNumFolders(handle)] : nil;
}

@end