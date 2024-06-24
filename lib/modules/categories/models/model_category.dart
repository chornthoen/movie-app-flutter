
class CategoryModel {

  CategoryModel({
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
}

final List<CategoryModel> categories = [
  CategoryModel(
    image: 'https://assets1.ignimgs.com/2019/06/27/amazing-spider-man-2-1561676725704.jpg',
    title: 'Action',
  ),
  CategoryModel(
    image: 'https://netstorage-tuko.akamaized.net/images/62986d234ef17429.jpg?imwidth=900',
    title: 'Adventure',
  ),
  CategoryModel(
    image: 'https://hips.hearstapps.com/hmg-prod/images/screen-shot-2020-05-13-at-12-35-35-pm-1589387749.png?crop=0.8043478260869565xw:1xh;center,top&resize=980:*',
    title: 'Comedy',
  ),
  CategoryModel(
    image: 'https://cdn.mos.cms.futurecdn.net/PKkcY5vSWcNPQPHyKuagfC.jpg',
    title: 'Romance',
  ),
  CategoryModel(
    image: 'https://cdn.pixabay.com/photo/2023/05/16/17/07/horror-7998138_1280.png',
    title: 'Horror',
  ),
  CategoryModel(
    image: 'https://media.wired.com/photos/65e0eefa5219eea4065600e1/master/w_2560%2Cc_limit/Best-Sci-Fi-Movie-Guide-Culture-rev-1-DUN2-27779rv2_High_Res_JPEG-(1).jpg',
    title: 'Sci-Fi',
  ),
  CategoryModel(
    image: 'https://www.looper.com/img/gallery/30-best-romantic-anime-movies-ranked/intro-1707789907.jpg',
    title: 'Anime',
  ),
];
