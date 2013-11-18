//
//  CTTimerViewController.m
//  CuociTempo
//
//  Created by Michele Navolio on 18/11/13.
//  Copyright (c) 2013 Michele Navolio. All rights reserved.
//

#import "CTTimerViewController.h"

@interface CTTimerViewController (){
 
    int countdown;
    BOOL isRunning;
    
}
@end

@implementation CTTimerViewController

//@synthesize tempo = _tempo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //NSLog(@"peso %i",self.peso);
  //  NSLog(@"cottura %@",self.cottura);
    
  //  countdown = self.tempo.time.doubleValue*60;
    
    countdown = 60;
    
    self.countdownLabel.text = [self formattazioneLabel];
    
    /*  self.swipeToBack = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(back:)];
     [self.swipeToBack setDirection:(UISwipeGestureRecognizerDirectionRight)];
     [self.view addGestureRecognizer:self.swipeToBack];*/
    
    
}

- (IBAction)start:(id)sender {
    
    //controllo se sta gia andando e se si impedisco l'esecuzione del resto del codice
    if (isRunning) return;
    
    //Impostiamo su si il booleano isRunning
    isRunning = YES;
    
    //Invochiamo il primo tick
   // [self spin];
    
    //Avviamo la data con il metodo scheduledTimerWithTimeInterval che ogni secondo invoca il metodo tick
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];

}

- (IBAction)stop:(id)sender {
    
    //Controlliamo se il timer è fermo, nel caso impediamo l'esecuzione del resto del codice
    if (!isRunning) return;
    
    
    //Impostiamo no il boolenao isRunning
    isRunning = NO;
  //  countdown = self.tempo.time.doubleValue*60;
    countdown = 60;
    
    [self.lancetta.layer removeAllAnimations];
    //Controlliamo se il timer è valido (cioè sta andando) e nel caso lo fermiamo
    //Se cercassimo di invalidare un timer fermo andrebbe in crash l'App
    if ( [self.theTimer isValid] ) [self.theTimer invalidate];
    
    //Assegnamo alla proprietà text della UILabel la stringa restituita dal metodo formattazioneLabel
    self.countdownLabel.text = [self formattazioneLabel];
    
}

-(void)tick{
    //sottraiamo uno dal countdown
    countdown--;
    
    //controlliamo che il valore di countdown sia minore di zero
    if (countdown < 0) {
        
        //se è minore di zero allora il timer è finito
        
        //Impostiamo no il boolenao isRunning
        isRunning = NO;
        
        //Controlliamo se il timer è valido (cioè sta andando) e nel caso lo fermiamo
        if ( [self.theTimer isValid] ) [self.theTimer invalidate];
        
        //Azzeriamo il tempo nella label
        self.countdownLabel.text = @"00:00:00";
        
        //Arrstiamo il codice
        return ;
    }
    
    //Assegnamo alla proprietà text della UILabel la stringa restituita dal metodo formattazioneLabel
    self.countdownLabel.text = [self formattazioneLabel];
}

- (NSString*)formattazioneLabel {
    
    //creo 3 numeri interi con la matematica necessaria per calcolare secondi, minuti e ore
    int hours = (countdown / 3600);
	int minutes = ((countdown / 60) - hours * 60);
	int seconds = (countdown - ((minutes * 60) + hours * 3600));
    
    //Rappresentiamo il tempo formattando una stringa in questo modo
	NSString* rap = [NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, seconds];
    
    //restituiamo il valore della stringa rap
    return rap;
}

@end
