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

@end

@implementation HomeViewController

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
    
}

- (IBAction)pushFlutter:(id)sender {
//    self.flutterVc.modalPresentationStyle = UIModalPresentationFullScreen;

    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
    [flutterViewController setInitialRoute:@"goodsDetail"];
//    [self.navigationController pushViewController:flutterViewController animated:YES];
    
    [self presentViewController:flutterViewController animated:YES completion:nil];
}


- (IBAction)pushFlutter2:(id)sender {
//    self.flutterVc.modalPresentationStyle = UIModalPresentationFullScreen;
    
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] init];
    [flutterViewController setInitialRoute:@"myApp"];
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    static int a = 0;
//    [self.msgChannel sendMessage:[NSString stringWithFormat:@"%d",a++]];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
