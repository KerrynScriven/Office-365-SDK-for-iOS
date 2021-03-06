/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSOutlookCalendarGroupFetcher.h"
#import "MSOutlookCalendarCollectionFetcher.h"


/**
* The implementation file for type MSOutlookCalendarGroupFetcher.
*/


@implementation MSOutlookCalendarGroupFetcher

-(MSOutlookCalendarGroupOperations*) getOperations{
	return [[MSOutlookCalendarGroupOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSOutlookCalendarGroup class]];
}

-(NSURLSessionDataTask*) updateCalendarGroup:(id)entity withCallback:(void (^)(MSOutlookCalendarGroup*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionDataTask*) deleteCalendarGroup:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}


-(MSOutlookCalendarCollectionFetcher*) getCalendars{
    return [[MSOutlookCalendarCollectionFetcher alloc] initWithUrl:@"Calendars" parent:self andEntityClass:[MSOutlookCalendar class]];
}

-(MSOutlookCalendarFetcher*) getCalendarsById : (NSString*)_id{
    return [[[MSOutlookCalendarCollectionFetcher alloc] initWithUrl:@"Calendars" parent:self andEntityClass:[MSOutlookCalendar class]] getById:_id];
}

@end