class ServerData {
  // 本地mock数据，实际上是模拟网络数据
  static String fetchDataFromServer() => """[
    {
        "title": "示例视频",
        "url": "http://vfx.mtime.cn/Video/2019/03/19/mp4/190319212559089721.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://prod-streaming-video-msn-com.akamaized.net/a8c412fa-f696-4ff2-9c76-e8ed9cdffe0f/604a87fc-e7bc-463e-8d56-cde7e661d690.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://prod-streaming-video-msn-com.akamaized.net/0b927d99-e38a-4f51-8d1a-598fd4d6ee97/3493c85c-f35a-488f-9a8f-633e747fb141.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "http://vfx.mtime.cn/Video/2019/03/14/mp4/190314223540373995.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://vfx.mtime.cn/Video/2019/08/24/mp4/190824113155647173.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://prod-streaming-video-msn-com.akamaized.net/e908e91f-370f-49ad-b4ce-775b7e7a05b4/a6287f74-46f0-42f9-b5d9-997f00585696.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://v-cdn.zjol.com.cn/276985.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://klxxcdn.oss-cn-hangzhou.aliyuncs.com/histudy/hrm/media/bg2.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://stream7.iqilu.com/10339/article/202002/16/3be2e4ef4aa21bfe7493064a7415c34d.mp4",
        "playCount": 88
    }
]""";

  static String fetchPrivateFromServer() => """[
    {
        "title": "示例视频",
        "url": "https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218093206z8V1JuPlpe.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://stream7.iqilu.com/10339/article/202002/18/02319a81c80afed90d9a2b9dc47f85b9.mp4",
        "playCount": 88
    },
    {
        "title": "示例视频",
        "url": "https://klxxcdn.oss-cn-hangzhou.aliyuncs.com/histudy/hrm/media/bg2.mp4",
        "playCount": 88
    }
]""";
}
