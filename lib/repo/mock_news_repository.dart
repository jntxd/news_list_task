import 'package:news_list_task/repo/abstract_news_repository.dart';
import 'package:news_list_task/repo/models/article.dart';

class MockNewsRepository implements AbstractNewsRepository {
  @override
  Future<List<Article>> getLatestArticles() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockArticles;
  }

  /// Can throw [StateError]
  @override
  Future<Article> getArticle(String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockArticles.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Article>> getFeaturedArticles() async {
    await Future.delayed(const Duration(seconds: 2));
    return _mockArticles;
  }
}

final _mockArticles = [
  Article(
    id: '1',
    title: '''
Scientists discover an ancient landscape''',
    publicationDate: DateTime.now().subtract(const Duration(days: 1)),
    imageUrl: 'assets/images/image_1.jpg',
    description:
        '''An ancient landscape hidden under the East Antarctic ice sheet for at least 14 million years has been revealed with the help of satellite data and planes equipped with ice-penetrating radar.

Scientists used the remote sensing techniques to map 32,000 square kilometers (12,300 square miles) of land — an area around the same size as Belgium. They discovered a landscape formed by rivers prior to the continental build-up of the East Antarctic ice sheet that would have once resembled the hills and valleys of present-day North Wales, according to a study published Tuesday in the journal Nature Communications.''',
  ),
  Article(
    id: '2',
    title: 'Two strangers...',
    publicationDate: DateTime.now().subtract(const Duration(days: 2)),
    imageUrl: 'assets/images/image_2.jpg',
    description:
        '''Two strangers moved into an apartment in Prague. Then they fell in love. A spacious room in an Art Nouveau building in the buzzy Vinohrady neighborhood, near the city’s Riegrovy Sady park, known for its beautiful sunsets.

It was December 2019. Mandy was a 22-year-old about to graduate Texas A&M University. She was planning to move to Prague to teach English.

She’d joined a Facebook group called “Flatshare in Prague”, hoping to find somewhere to live. The Vinohrady room was advertised by a Facebook user called Marcus Wecksten. Alongside photos of the apartment, Marcus wrote that the current inhabitants were two guys – one Finnish (Marcus) and one German (his roommate, Boris). Marcus and Boris were both students in Prague and were looking for someone to move in ASAP.

 ''',
  ),
  Article(
    id: '3',
    title: '‘Leaning tower’ in Italy closed',
    publicationDate: DateTime.now().subtract(const Duration(days: 2, hours: 4)),
    imageUrl: 'assets/images/image_3.jpg',
    description:
        '''ante Alighieri was so spellbound that he wrote about it twice: in the “Divine Comedy,” and in another sonnet. Charles Dickens was struck by it when traveling around Italy. And now the medieval Garisenda “leaning” tower in Bologna is sparking very modern publicity, with concern that it might be subsiding.

Streets around the Garisenda – one of Bologna’s “twin towers” perched together in the city center – have been sealed off as scientists monitor the monument for evidence of the structure cracking and moving.

The 48-meter (158 feet) tower was built in the 12th century when Bologna was a mini Manhattan, with dozens of towers reaching towards the sky, each built by local families trying to construct theirs higher than the last. But it leans at an angle of four degrees – only a little more upright than the Leaning Tower of Pisa, set at a tipsy five-degree angle. It was already leaning by the early 14th century when Dante wrote “Inferno,” in which he described the dizzy rush of looking up at the Garisenda’s leaning side. A plaque on the tower today commemorates the verse dedicated to it.

Shortened in later years, it sits in the city center beside the Asinelli – a tower twice the height, which tourists can climb.

City mayor Matteo Lepore blocked off the area around the towers at the weekend after meeting with the city’s heritage superintendent and the committee of scientists which has been monitoring the pair since 2018, to “conduct further monitoring and install sensors… to have definitive information about the state of health of the Garisenda,” he announced at a city council meeting on Monday, in a speech shared with CNN.

Acoustic sensors have been placed around the tower to monitor any stress noise of cracks or creaks, while a pendulum has also been installed to track movement.

Visitor access to the Asinelli has also been halted, and a pendulum will also be installed in the higher tower.

''',
  ),
  Article(
    id: '4',
    title: 'Types of music could help you feel less pain',
    publicationDate: DateTime.now().subtract(const Duration(days: 3, hours: 5)),
    imageUrl: 'assets/images/image_4.jpg',
    description:
        '''When Adele debuted her 2011 single “Someone Like You,” her bittersweet ballad resonated with millions worldwide. More than a decade later, it remains one of her most popular tunes. Her artistry, as well as that of many others who have mastered the art of tugging at our heartstrings with slow and emotional beats, has a way of managing the emotional pain of heartbreak and loss.There is no doubt that music can soothe the soul for some, and it turns out that it could also be a temporary soother for physical pain.

Listening to favorite songs could reduce people’s perception of pain, according to a new study published Wednesday in the journal Frontiers in Pain Research. And the most effective pain relievers were found to be sad songs detailing bittersweet and emotional experiences.“It doesn’t take the place of Tylenol when you have a headache, but music can help take the edge off,” said Patrick Stroman, a professor of biomedical and molecular sciences at Queen’s University in Kingston, Ontario. He was not involved in the latest study but has conducted his own research on the relationship between pain and music. Unlike other medications, he noted, there is no side effect or risk to listening to music (just keep the volume at a reasonable level).

The small study invited 63 young adults to bring two of their favorite songs, and the only requirement was that they needed to be at least 3 minutes and 20 seconds long. One selection represented their favorite music of all time, and the other was the song they would bring with them on a desert island. The researchers also had the young adults pick one of seven songs that the team considered relaxing and were unfamiliar to the study participants. (The seven they could choose from were “Cotton Blues,” “Jamaicare,” “Légende Celtique,” “Musique de Film,” “Nuit Cubaine,” “Reggae Calédonien” and “Sega Mizik Kèr.”)''',
  ),
];
