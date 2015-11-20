//
//  ViewController.m
//  dongqiudishuapin
//
//  Created by lazy on 15/9/13.
//  Copyright (c) 2015年 lazy. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#define _AFNETWORKING_ALLOW_INVALID_SSL_CERTIFICATES_

@interface ViewController (){
    NSInteger count;
}

@property (nonatomic, strong) NSArray *array;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:0.0001f target:self selector:@selector(refreshTicket) userInfo:nil repeats:YES];
    self.array = @[@"333",@"2",@"。。",@"。。。",@"0",@"aaa",@"b",@"c",@"f",@"1"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshTicket{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"ba39360d458f9034debbe43f678bc402afa54f4d" forHTTPHeaderField:@"UUID"];
    [manager.requestSerializer setValue:@"a0913_times=1; remember_82e5d2c56bdd0811318f0cf078b78bfc=eyJpdiI6ImRcL0M3NEJYd0x1aFdPTjZzOSszSlwvYm9FM0lzdVlWQXVcL1RRV2Yyd1dXbmc9IiwidmFsdWUiOiJRNzByZVdmQ242S013UHlibWJLbUY0OCtEWnhIemN1c1wvZ05MeDhSdHpOSkUzOWFsYUtcL2dUUWg4SHZcLzlZWVJ0Ym45V2J2K3V1bGMzWG5iMkJlTVlOYnRBYVRnRGxCbDdHM1lxWkJFVkZkMVhtcnlCcXN5Z25RQlZJMVBDd0pqRSIsIm1hYyI6ImNiZDliYmUwOGYyNTYxMjMyMzg1NzEwZWNlYzAyMzljM2FhYzA2YzhmZTcyZDdhOTg1NjNhNjI1MzI3NWI2NTUifQ%3D%3D; laravel_session=eyJpdiI6ImJjVmFrYU51cFpTZ1lxWmpcL1BKWGx1cWwwcGYxU2trQ1B1SWY1SnpYbnZzPSIsInZhbHVlIjoiQ2lnQzkwWmU5akk5M3B0KzZEeVZFd1FHRFhaRW9kSE1SMHN0WDlqK3NiUmd1MUljSU44UVI2VEJ0cFNqam82YjBkdmcxZGRUVXlydXRQbG0wWEpUNlE9PSIsIm1hYyI6IjQyYmNjNDcwZWU3MTgwNGFiZmVlNWE3MGNhNDBmNzY0NGY2NDRiZmE2OTc2MDlhNjU4NTA0N2UyOTFhMmZhYTkifQ%3D%3D" forHTTPHeaderField:@"Cookie"];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy = policy;
    NSInteger idx =  arc4random() % 10;
    NSString *content = [self.array objectAtIndex:idx];
    
    //NSString *content = [NSString stringWithFormat:@"%d",rand() % 200];
    
    NSString *uri = @"http://api.dongqiudi.com/articles/create_comment/131113";
    [manager POST:uri parameters:@{@"content":content} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        count++;
        NSLog(@"%@",@(count));
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
    }];
}

@end
