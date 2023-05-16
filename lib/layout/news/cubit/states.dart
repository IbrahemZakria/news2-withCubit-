abstract class newsStats {}

class newsInitialStats extends newsStats {}

class bottomnavstate extends newsStats {}

class getbusinessDatasucesstate extends newsStats {}

class getbusinessDataerrorstate extends newsStats {
  final Error;
  getbusinessDataerrorstate(this.Error);
}

class getsearchDatasucesstate extends newsStats {}

class getsearchDataerrorstate extends newsStats {
  final Error;
  getsearchDataerrorstate(this.Error);
}

class loadingstate extends newsStats {}

class getsportsDatasucesstate extends newsStats {}

class getsportsDataerrorstate extends newsStats {
  final Error;
  getsportsDataerrorstate(this.Error);
}

class getscienceDatasucesstate extends newsStats {}

class getscienceDataerrorstate extends newsStats {
  final Error;
  getscienceDataerrorstate(this.Error);
}

class changethemsstate extends newsStats {}
