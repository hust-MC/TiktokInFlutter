class VideoModel {
  final String url;
  final int count;
  final int loop;

  VideoModel(this.url, {this.count = 0, this.loop = -1});
}