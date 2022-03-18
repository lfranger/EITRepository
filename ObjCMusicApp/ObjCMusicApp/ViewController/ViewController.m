//
//  ViewController.m
//  ObjCMusicApp
//
//  Created by Consultant on 3/17/22.
//

#import "DetailViewController.h"
#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    _bandsList = @[@"Oasis", @"Paramore", @"The Stone Roses", @"The Beatles", @"Michael Jackson"];
    
    _genreList = @[@"Rock/Britpop", @"Alternative Rock/Pop Punk", @"Alternative Rock/Madchester", @"Rock/Pop", @"Pop/Rock"];
    
    _bandImages = @[@"oasis.jpg", @"paramore.jpg", @"stoneroses.jpg", @"beatles.jpg", @"michaeljackson.jpg"];
    
    _bandDescriptions = @[@"Oasis were an English rock band formed in Manchester in 1991. They were originally known as the Rain before evolving into Oasis, and initially consisted of Liam Gallagher (lead vocals, tambourine), Paul Arthurs (guitar), Paul McGuigan (bass guitar), and Tony McCarroll (drums). Upon returning to Manchester, Liam's older brother Noel (lead guitar, vocals) joined as a fifth member, finalising the band's core line-up. During the course of their existence, they had various line-up changes, though the Gallagher brothers remained as the staple members.",
        
        @"Paramore is an American rock band from Franklin, Tennessee, formed in 2004. The band currently consists of lead vocalist Hayley Williams, guitarist Taylor York and drummer Zac Farro. Williams and Farro are founding members of the group, while York, a high school friend of the original lineup, joined in 2007.",
                          
        @"The Stone Roses were an English rock band formed in Manchester in 1983. One of the pioneering groups of the Madchester movement in the late 1980s and early 1990s, the band's classic and most prominent lineup consisted of vocalist Ian Brown, guitarist John Squire, bassist Mani and drummer Reni.",
                          
        @"The Beatles were an English rock band, formed in Liverpool in 1960, that comprised John Lennon, Paul McCartney, George Harrison and Ringo Starr. They are regarded as the most influential band of all time and were integral to the development of 1960s counterculture and popular music's recognition as an art form.",
                          
        @"Michael Joseph Jackson (August 29, 1958 – June 25, 2009) was an American singer, songwriter, and dancer. Dubbed the \"King of Pop\", he is regarded as one of the most significant cultural figures of the 20th century. Over a four-decade career, his contributions to music, dance, and fashion, along with his publicized personal life, made him a global figure in popular culture. Jackson influenced artists across many music genres; through stage and video performances, he popularized complicated dance moves such as the moonwalk, to which he gave the name, as well as the robot. He is the most awarded individual music artist in history.",
    ];
    
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _bandsList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [_bandsList objectAtIndex: indexPath.row];
    cell.detailTextLabel.text = [_genreList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"segue" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segue"])
    {

        DetailViewController *detailViewController = [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger row = [indexPath row];
        
        detailViewController.DetailBand = @[_bandsList[row], _bandImages[row], _bandDescriptions[row]];
    }
}

@end
