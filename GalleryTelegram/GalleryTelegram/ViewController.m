//
//  ViewController.m
//  GalleryTelegram
//
//  Created by Michel de Sousa Carvalho on 29/01/15.
//  Copyright (c) 2015 Michel de Sousa Carvalho. All rights reserved.
//

#import "ViewController.h"
#import "TGPhotoGridController.h"
#import "TGMidia.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)seePhotosButton:(id)sender {
    TGMidia *midia1 = [[TGMidia alloc] init];
    midia1.urlMidiaFull = @"http://s2.glbimg.com/vbaOvNRg89JI_3L_O1OhiAmz-8Q=/90x68/s.glbimg.com/jo/g1/f/original/2013/12/29/cap1.jpg";
    TGMidia *midia2 = [[TGMidia alloc] init];
    midia2.urlMidiaFull = @"http://s2.glbimg.com/jdPHLoVINoefnufKS5QIyJofZtc=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/17/31372.jpg";
    TGMidia *midia3 = [[TGMidia alloc] init];
    midia3.urlMidiaFull = @"http://s2.glbimg.com/T0YgUsqILh9fwC1wt7a6tR8EFGk=/90x68/s.glbimg.com/jo/g1/f/original/2011/05/14/haiti300x200.jpg";
    TGMidia *midia4 = [[TGMidia alloc] init];
    midia4.urlMidiaFull = @"http://s2.glbimg.com/5vNTs5PfL4Z0AiMhc_wMZiRz1TU=/90x68/s.glbimg.com/jo/g1/f/original/2015/01/19/acidente_fatal_trevo_de_perdizes_homem_de_29_anos.16-01-1.jpg";
    
    NSMutableArray *midias = [[NSMutableArray alloc] init];
    [midias addObject:midia1];
    [midias addObject:midia2];
    [midias addObject:midia3];
    [midias addObject:midia4];
    
    [self performSegueWithIdentifier:@"segueViewPhoto" sender:midias];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"segueViewPhoto"]){
        TGPhotoGridController *photoController = [segue destinationViewController];
        photoController.midias = sender;
    }
}

@end
