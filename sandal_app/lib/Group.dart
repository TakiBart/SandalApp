class Group{
  final String id;
  final String name;
  final String shortName;
  final String image;
  final String description;
  final String shortDescription;
  final String time;
  final String leader;
  // TODO: How to implement link.
  final String fbLink;


  // TODO: Think about that view with picture, prospectively choose picture(s?).
  // photo by Dan
  static final String picture = "http://dasandal.pl/public/.imaging/mte/dasandal-theme/large/dam/galeries/Holandia-2018/_DSC2470.jpg/jcr:content/_DSC2470.jpg";

  const Group({this.id, this.name, this.shortName, this.image, this.description,
    this.shortDescription, this.time, this.leader, this.fbLink});
}

// TODO: Shorter time format? E.g. Pn, 21:00 (plebania).
// TODO: Add some short name to show in ListView? E.g. Nikodem instead of Grupa Medytacyjna Nikodem
// TODO: Add some short description to show at ListView?
// TODO: Fill data with other groups.
// TODO: Move descriptions to other file?
List<Group> groups = [
  const Group(
    id: "1",
    name: "Grupa Medytacyjna \"Nikodem\"",
    shortName: "Nikodem",
    image: "assets/img/temp.jpg",
    description: "Podobnie, jak Nikodem, przychodzimy nocą zadawać ważne pytania Bogu. W Słowie Bożym chcemy szukać odpowiedzi na te najbardziej nurtujące - dotyczące drogi życiowej, miłości, szczęścia... Na spotkaniach rozważamy fragment Ewangelii przewidziany na najbliższą niedzielę. Oprócz krótkiego wyjaśnienia, medytacji w ciszy jest też możliwość dzielenia się Słowem i zadawania pytań odnośnie znaczenia tekstu. Na spotkanie warto zabrać ze sobą Pismo Święte i coś do pisania.",
    shortDescription: "Spotkania o zmroku",
    time: "poniedziałek, godz. 21.00 (plebania)",
    leader: null,
    fbLink: null,
  ),
  const Group(
    id: "2",
    name: "Grupa Postakademicka \"Droga\"",
    shortName: "Droga",
    image: "assets/img/temp.jpg",
    description: "Po okresie studiów czas wyruszyć w drogę. Warto szukać na niej drogowskazów i czasem się zatrzymać, żeby nie pobłądzić. Ta grupa to propozycja dla tych, którzy zakończyli swoją akademicką przygodę, ale chcieliby kontynuować formację w gronie ludzi młodych. Zapraszamy osoby w  wieku 26-33 lat. Spotkania odbywają się w cyklu cztero tygodniowym:\n• Msza święta, a po niej integracja (I)\n• konwersatorium (II)\n• medytacja biblijna z adoracją Najświętszego Sakramentu (III)\n• wykład o tematyce teologicznej (IV)",
    shortDescription: "Wyrusz w Drogę!",
    time: "wtorek, godz. 19.15 (świetlica)",
    leader: null,
    fbLink: null,
  ),
  const Group(
    id: "3",
    name: "Studencka Służba Liturgiczna",
    shortName: "SSL",
    image: "assets/img/temp.jpg",
    description: "Liturgia jest piękna dzięki obecności Bożej i znakom, które tej obecności towarzyszą. Ich dobre przygotowanie może pomóc w lepszym przeżyciu misterium. Stąd potrzeba służby liturgicznej, która zadba, by liturgia faktycznie ukazywała Boga, a nie koncentrowała uwagi na różnych niedoskonałościach i brakach. Zachęcamy wszystkich studentów i ludzi młodych do zaangażowania się w Studencką Służbę Liturgiczną, która posługuje na Mszach akademickich – zwłaszcza o 20.30 w każdą niedzielę. Nie jest ważne czy wcześniej byłeś ministrantem lub lektorem – każdy zainteresowany może liczyć na przygotowanie do pełnienia różnych funkcji w zgromadzeniu liturgicznym. Ci którzy już są ministrantami lub lektorami z pewnością będą mieli okazję, by pogłębić swoją wiedzę liturgiczną.",
    shortDescription: "Prezes jest tylko jeden",
    time: "niedziela, godz. 20.00 (zakrystia)",
    leader: "Paweł Druć",
    fbLink: "http://www.facebook.com/groups/675985865900401/",
  ),
  const Group(
    id: "4",
    name: "Klub Kulturalny MUZA",
    shortName: "MUZA",
    image: "assets/img/temp.jpg",
    description: "Każdy z nas potrzebuje wszechstronnego rozwoju. Wśród Imion Boga wymieniamy jednym tchem Prawdę i Dobro, a zapomnieliśmy – jak stwierdził bp Michał Janocha – że Bóg ma też na imię „Piękno”. Tego piękna chcemy szukać w ramach spotkań Klubu Kulturalnego Muza. Zapraszamy na wspólne wyjścia do teatru, filharmonii, kina, na tańce oraz dyskusje po obejrzeniu dobrego filmu.",
    shortDescription: "Przykrywka Sandacza",
    time: "wedle harmonogramu na grupie",
    leader: "Gabriela Prokop, Przemysław Lichnowski",
    fbLink: "http://www.facebook.com/groups/KKMuza",
  ),
  const Group(
    id: "5",
    name: "Kawiarenka akademicka",
    shortName: "Kawiarenka",
    image: "assets/img/temp.jpg",
    description: "W każdą niedzielę, po wieczornej Mszy akademickiej zapraszamy wszystkich studentów i ludzi młodych do spędzenia chwili czasu w kawiarence. To dobra okazja, by rozmawiać o Słowie Bożym usłyszanym podczas Mszy świętej i zadać nurtujące pytania. Można też w dobrym towarzystwie przygotować się do akademickich zmagań, które już następnego dnia rano.",
    shortDescription: "...herbaty szklanka wiernej...",
    time: "niedziela, godz. 21.30 (świetlica)",
    leader: "Martyna Matusiak",
    fbLink: null,
  ),
  const Group(
    id: "6",
    name: "Studencki Kurs Gitarowy",
    shortName: "Gitara",
    image: "assets/img/temp.jpg",
    description: "Być niczym Chuck Berry a swoją grą na gitarze wzruszać serce ukochanej lub ukochanego? Zawsze o tym myślałeś, ale jakoś nie było okazji? Szukałeś grona, w którym mógłbyś czuć się swobodnie i rozwijać umiejętności muzyczne we własnym tempie? Jesteś studentem? Masz gitarę? Zatem zapraszamy na Studencki Kurs Gitarowy!",
    shortDescription: "Paamięętaj mnie!",
    time: "wtorek, 20.00 (świetlica)",
    leader: "Marcin Sierawski",
    fbLink: null,
  ),
  const Group(
    id: "7",
    name: "Projekt \"Arka\"",
    shortName: "Arka",
    image: "assets/img/temp.jpg",
    description: "Lubisz majsterkować? Żeglować? A może chcesz spróbować czegoś nowego? Jeśli choć na jedno pytanie odpowiedziałeś twierdząco, zapraszamy Cię do budowy naszej łodzi – Arki Sandała! Dzięki pomocy Harcerstwa Wodnego masz niepowtarzalną okazję popływać na własnoręcznie odrestaurowanej łodzi, i poczuć się jak pierwsi uczniowie Jezusa – rybacy! Przy okazji nauczysz się współpracy w grupie, odpowiedzialności, i obsługi różnych narzędzi, co na pewno przyda Ci się w życiu. Możesz także zdobyć patenty, a przede wszystkim zacieśnić więzy przyjaźni ze wspaniałymi ludźmi! Poprzez wiarę, pracę, wytrwałość, i stawanie naprzeciw wyzwań budujemy także tę ważniejszą Arkę. Tę, która jest wewnątrz nas, aby była w stanie oprzeć się potopom życia codziennego.",
    shortDescription: "Wypłyń na Głębię!",
    time: "wedle harmonogramu na grupie",
    leader: "Bartłomiej Suzonowicz",
    fbLink: "http://www.facebook.com/groups/195485391037713/",
  )
];