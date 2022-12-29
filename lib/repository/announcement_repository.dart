
import 'package:eventxandroid/api/announcement_api.dart';
import 'package:eventxandroid/models/announcement/announcement_model.dart';

class AnnouncementRepository {
  Future<List<AnnouncementModel?>> loadAnnouncement() async {
    return AnnouncementAPI().loadAnnouncement();
  }

  Future<bool> readAnnouncement(String announcementId)async{
    return AnnouncementAPI().readAnnouncement(announcementId);
  }
}
