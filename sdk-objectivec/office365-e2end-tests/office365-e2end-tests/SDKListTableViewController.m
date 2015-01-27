/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "SDKListTableViewController.h"

@implementation SDKListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.availableSdks = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)loadInitialData {
    [self.availableSdks addObject:@"Exchange"];
    [self.availableSdks addObject:@"Files"];
    [self.availableSdks addObject:@"Discovery"];
        [self.availableSdks addObject:@"Lists"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.availableSdks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    NSString *sdkName= [self.availableSdks objectAtIndex:indexPath.row];
    cell.textLabel.text = sdkName;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *name = [self.availableSdks objectAtIndex:indexPath.row];
    
    
    if([name isEqualToString:@"Exchange"]){
        [[[BaseController alloc]init]getMailClient:^(MSOutlookClient *c) {
            MailTestRunner *runner = [[MailTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
    
    if([name isEqualToString:@"Files"]){
        [[[BaseController alloc]init]getSharePointClient:^(MSSharePointClient *c) {
            FilesTestRunner *runner = [[FilesTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
    
    if([name isEqualToString:@"Discovery"]){
        [[[BaseController alloc]init]getDiscoveryClient:^(MSDiscoveryClient *c) {
            DiscoveryTestRunner *runner = [[DiscoveryTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
    
    if([name isEqualToString:@"Lists"]){
        [[[BaseController alloc]init]getListClient:^(ListClient *c) {
            ListTestRunner *runner = [[ListTestRunner alloc] initWithClient:c];
            [self performSegueWithIdentifier:@"segue" sender:runner];
        }];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"segue"]){
        TestRunnerTableViewController *vc =  segue.destinationViewController;
        vc.TestRunner = (BaseTestRunner*)sender;
    }
}

@end
