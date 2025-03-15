class AppConfig {
  //when using your computer as client use serverIP=127.0.0.1
  //when using android emulator use serverIP=10.0.2.2
  //when using your phone over wi-fi find your server's actual ip and use it instead
  static const String serverIP =
      'miniproject-backend-production.up.railway.app';

  static const String url = 'https://$serverIP/job_finder';
}
