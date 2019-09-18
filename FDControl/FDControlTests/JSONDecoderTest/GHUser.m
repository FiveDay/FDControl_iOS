//
//  GHUser.m
//  FDControlTests
//
//  Created by zhangyu528 on 2019/9/18.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "GHUser.h"

@implementation FDGHUser

- (instancetype)initWithFDCoder:(FDCoder *)coder {
    if (self = [super init]) {
        self.login = [coder decode:[NSString class] key:@"login"];
        self.userID = ((NSNumber*)[coder decode:[NSString class] key:@"id"]).integerValue;
        self.avatarURL = [coder decode:[NSString class] key:@"avatar_url"];
        self.gravatarID = [coder decode:[NSString class] key:@"gravatar_id"];
        self.url = [coder decode:[NSString class] key:@"url"];
        self.htmlURL = [coder decode:[NSString class] key:@"html_url"];
        self.followersURL = [coder decode:[NSString class] key:@"followers_url"];
        self.followingURL = [coder decode:[NSString class] key:@"following_url"];
        self.gistsURL = [coder decode:[NSString class] key:@"gists_url"];
        self.starredURL = [coder decode:[NSString class] key:@"starred_url"];
        self.subscriptionsURL = [coder decode:[NSString class] key:@"subscriptions_url"];
        self.organizationsURL = [coder decode:[NSString class] key:@"organizations_url"];
        self.reposURL = [coder decode:[NSString class] key:@"repos_url"];
        self.eventsURL = [coder decode:[NSString class] key:@"events_url"];
        self.receivedEventsURL = [coder decode:[NSString class] key:@"envtes_url"];
        self.type = [coder decode:[NSString class] key:@"type"];
        self.siteAdmin = ((NSNumber*)[coder decode:[NSNumber class] key:@"site_admin"]).boolValue;
        self.name = [coder decode:[NSString class] key:@"name"];
        self.company = [coder decode:[NSString class] key:@"company"];
        self.blog = [coder decode:[NSString class] key:@"blog"];
        self.location = [coder decode:[NSString class] key:@"location"];
        self.email = [coder decode:[NSString class] key:@"email"];
        self.hireable = [coder decode:[NSString class] key:@"hireable"];
        self.bio = [coder decode:[NSString class] key:@"bio"];
        self.publicRepos = ((NSNumber*)[coder decode:[NSNumber class] key:@"publicRepos"]).unsignedIntValue;
        self.publicGists = ((NSNumber*)[coder decode:[NSNumber class] key:@"publicGist"]).unsignedIntValue;
        self.followers = ((NSNumber*)[coder decode:[NSNumber class] key:@"followers"]).unsignedIntValue;
        self.following = ((NSNumber*)[coder decode:[NSNumber class] key:@"following"]).unsignedIntValue;
    }
    return self;
}

@end
