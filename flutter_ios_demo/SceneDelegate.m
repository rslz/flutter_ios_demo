//
//  SceneDelegate.m
//  flutter_ios_demo
//
//  Created by mv_rslz on 2022/1/21.
//

#import "SceneDelegate.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;

    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];

    self.window.backgroundColor = [UIColor whiteColor];
    self.window.frame = windowScene.coordinateSpace.bounds;


    //1.创建Tab导航条控制器
    UITabBarController *tabControl = [[UITabBarController alloc] init];
    tabControl.tabBar.barStyle = UIBarStyleBlack;
    
    UITabBar *tabbar = tabControl.tabBar;
    UIColor *tabRedColor = [UIColor colorWithRed:0.929f green:0.243f blue:0.259f alpha:1.00f];
    tabbar.tintColor = tabRedColor;
    tabbar.translucent = NO;
    tabbar.barTintColor = [UIColor whiteColor];
    
    tabbar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    tabbar.layer.shadowOffset = CGSizeMake(0,-3);
    tabbar.layer.shadowOpacity = 0.1;   //阴影透明度，默认0
    tabbar.layer.shadowRadius = 4;  //阴影半径，默认3
    
    //2.创建相应的子控制器（viewcontroller）
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"home" image:[[UIImage imageNamed:@"Tabbar-Icon-PersonalPage-Normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Tabbar-Icon-PersonalPage-HighLighted"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav1= [[UINavigationController alloc]initWithRootViewController: homeVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    mineVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"mine" image:[[UIImage imageNamed:@"Tabbar-Icon-Contact-Normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:@"Tabbar-Icon-Contact-HighLighted"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController: mineVC];
    
    //将Tab导航条控制器设为window根控制器
    [tabControl setViewControllers:@[ nav1, nav2]];

    
    self.window.rootViewController = tabControl;

    //显示window
    [self.window makeKeyAndVisible];

}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
