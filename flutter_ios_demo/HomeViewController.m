//
//  HomeViewController.m
//  flutter_ios_demo
//
//  Created by mv_rslz on 2022/1/21.
//

#import "HomeViewController.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface HomeViewController ()
@property (nonatomic, strong) FlutterEngine *flutterEngine;
@property (nonatomic, strong) FlutterViewController *flutterVc;
@property (nonatomic, strong) FlutterBasicMessageChannel *msgChannel;
@end

@implementation HomeViewController

- (FlutterEngine *)flutterEngine {
    if (!_flutterEngine) {
        FlutterEngine *engine = [[FlutterEngine alloc]initWithName:@"lcr"];
        if (engine.run) {
            _flutterEngine = engine;
        }
    }
    return _flutterEngine;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Home";
    self.view.backgroundColor = [UIColor lightGrayColor];
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navigationBarAppearance = [UINavigationBarAppearance new];
        //做一些设置，如：
        navigationBarAppearance.backgroundColor = [UIColor whiteColor];
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
    } else {
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    }
    
    
    self.flutterVc = [[FlutterViewController alloc]initWithEngine:self.flutterEngine nibName:nil bundle:nil];
    
    self.msgChannel = [FlutterBasicMessageChannel messageChannelWithName:@"messageChannel" binaryMessenger:self.flutterVc.binaryMessenger];
    
    [self.msgChannel setMessageHandler:^(id  _Nullable message, FlutterReply  _Nonnull callback) {
        NSLog(@"收到Flutter的：%@",message);
    }];
    
}

- (IBAction)pushFlutter:(id)sender {
    self.flutterVc.modalPresentationStyle = UIModalPresentationFullScreen;
    
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"one_page" binaryMessenger:self.flutterVc.binaryMessenger];
    
    [methodChannel invokeMethod:@"one" arguments:nil];
    
    [self presentViewController:self.flutterVc animated:YES completion:nil];
    
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"exit"]) {
            [self.flutterVc dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}


- (IBAction)pushFlutter2:(id)sender {
    self.flutterVc.modalPresentationStyle = UIModalPresentationFullScreen;
    
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"two_page" binaryMessenger:self.flutterVc.binaryMessenger];
    
    [methodChannel invokeMethod:@"two" arguments:nil];
    
    [self presentViewController:self.flutterVc animated:YES completion:nil];
    
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"exit"]) {
            [self.flutterVc dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int a = 0;
    [self.msgChannel sendMessage:[NSString stringWithFormat:@"%d",a++]];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
