class Group{
  final String id;
  final String name;
  final String image;
  final String description;
  final String time;
  final String leader;
  // TODO: How to implement link.
  final String fbLink;

  const Group({this.id, this.name, this.image, this.description,
    this.time, this.leader, this.fbLink});
}

List<Group> groups = [
  const Group(
    id: "1",
    name: "Grupa Medytacyjna \"Nikodem\"",
    image: "assets/img/temp.jpg",
    description: "Podobnie, jak Nikodem, przychodzimy nocą zadawać ważne pytania Bogu. [...]",
    time: "poniedziałek, godz. 21.00 (plebania)",
    leader: null,
    fbLink: null,
  ),
  const Group(
    id: "2",
    name: "Grupa Postakademicka \"Droga\"",
    image: "assets/img/temp.jpg",
    description: "Po okresie studiów czas wyruszyć w drogę.",
    time: "wtorek, godz. 19.15 (świetlica)",
    leader: null,
    fbLink: null,
  ),
  const Group(
    id: "3",
    name: "Studencka Służba Liturgiczna",
    image: "assets/img/temp.jpg",
    description: "Liturgia jest piękna dzięki obecności Bożej i znakom, które tej obecności towarzyszą.",
    time: "niedziela, godz. 20.00 (zakrystia)",
    leader: "Paweł Druć",
    fbLink: "http://www.facebook.com/groups/675985865900401/",
  ),
  const Group(
    id: "4",
    name: "Klub Kulturalny MUZA",
    image: "assets/img/temp.jpg",
    description: "Każdy z nas potrzebuje wszechstronnego rozwoju.",
    time: "wedle harmonogramu na grupie",
    leader: "Gabriela Prokop, Przemysław Lichnowski",
    fbLink: "http://www.facebook.com/groups/KKMuza",
  ),
  const Group(
    id: "5",
    name: "Kawiarenka akademicka",
    image: "assets/img/temp.jpg",
    description: "W każdą niedzielę, po wieczornej Mszy akademickiej zapraszamy wszystkich studentów i ludzi młodych do spędzenia chwili czasu w kawiarence.",
    time: "niedziela, godz. 21.30 (świetlica)",
    leader: "Martyna Matusiak",
    fbLink: null,
  ),
  const Group(
    id: "6",
    name: "Studencki Kurs Gitarowy",
    image: "assets/img/temp.jpg",
    description: "Być niczym Chuck Berry a swoją grą na gitarze wzruszać serce ukochanej lub ukochanego?",
    time: "wtorek, 20.00 (świetlica)",
    leader: "Marcin Sierawski",
    fbLink: null,
  ),
  const Group(
    id: "7",
    name: "Projekt \"Arka\"",
    image: "assets/img/temp.jpg",
    description: "Lubisz majsterkować? Żeglować?",
    time: "wedle harmonogramu na grupie",
    leader: "Bartłomiej Suzonowicz",
    fbLink: "http://www.facebook.com/groups/195485391037713/",
  )
];