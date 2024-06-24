
class ModelMovie{

  ModelMovie({
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
}

final List<ModelMovie> movieList = [

  ModelMovie(
    title: 'Avatar: The Way of Water 2022',
    image: 'https://upload.wikimedia.org/wikipedia/en/5/54/Avatar_The_Way_of_Water_poster.jpg',
  ),
  ModelMovie(
    title: 'Spider-Man: No Way Home (2021)',
    image: 'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_FMjpg_UX1000_.jpg',
  ),
  ModelMovie(
    title: 'How to Train Your Dragon: The Hidden World (2019)',
    image: 'https://m.media-amazon.com/images/M/MV5BMjIwMDIwNjAyOF5BMl5BanBnXkFtZTgwNDE1MDc2NTM@._V1_.jpg',
  ),
  ModelMovie(
    title: 'Venom: Let There Be Carnage (2021)',
    image: 'https://m.media-amazon.com/images/M/MV5BNTFkZjdjN2QtOGE5MS00ZTgzLTgxZjAtYzkyZWQ5MjEzYmZjXkEyXkFqcGdeQXVyMTM0NTUzNDIy._V1_.jpg',
  ),
  ModelMovie(
    title: 'The Avengers (2012)',
    image: 'https://m.media-amazon.com/images/M/MV5BNDYxNjQyMjAtNTdiOS00NGYwLWFmNTAtNThmYjU5ZGI2YTI1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg',
  ),

  ModelMovie(
    title: 'Venom: The Last Dance(2024)',
    image: 'https://upload.wikimedia.org/wikipedia/en/a/a3/Venom_The_Last_Dance_Poster.jpg',
  ),
];
