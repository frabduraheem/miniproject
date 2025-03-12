class AppConfig {
  //when using android emulator use serverIP=10.0.2.2
  //when using your phone over wi-fi find your server's actual ip and use it instead
  static const String serverIP = '10.0.2.2';

  static const String url = 'http://$serverIP:5000/job_finder';
}
