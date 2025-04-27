import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jcr_settat/core/models/event_model.dart';
import 'package:jcr_settat/core/models/message_model.dart';
import 'package:jcr_settat/core/models/visits_model.dart';
import 'package:jcr_settat/features/activity/data/model/activity_model.dart';
import 'package:jcr_settat/features/gallery/data/model/gallery_model.dart';

class FirestoreService {
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  CollectionReference initialEvent =
      FirebaseFirestore.instance.collection('initialEvent');
  CollectionReference activities =
      FirebaseFirestore.instance.collection('activities');
  CollectionReference galleries =
      FirebaseFirestore.instance.collection('galleries');
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  CollectionReference visits = FirebaseFirestore.instance.collection('visits');

  Future<List<Event>> getEvents() async {
    List<Event> eventsList = [];
    await events.orderBy('date', descending: true).get().then((event) {
      for (var doc in event.docs) {
        eventsList.add(Event.fromJson(doc));
      }
    });
    return eventsList;
  }

  Future<Event> getEvent(String id) async {
    dynamic data;
    Event event;
    await events.doc(id).get().then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    event = Event.fromJson(data);
    return event;
  }

  Future<Event> getInitialEvent() async {
    dynamic data;
    Event event;
    await initialEvent
        .doc('Initial_event')
        .get()
        .then<dynamic>((DocumentSnapshot snapshot) async {
      data = snapshot.data();
    });
    event = Event.fromJson(data);
    return event;
  }

  Future<List<Activity>> getActivities() async {
    List<Activity> activitiesList = [];
    await activities.get().then((activity) {
      for (var doc in activity.docs) {
        activitiesList.add(Activity.fromJson(doc));
      }
    });
    return activitiesList;
  }

  Future<List<Gallery>> getGalleries() async {
    List<Gallery> galleriesList = [];
    await galleries.orderBy('date').get().then((gallery) {
      for (var doc in gallery.docs) {
        galleriesList.add(Gallery.fromJson(doc));
      }
    });
    return galleriesList;
  }

  Future<void> addMessage(Message message) async {
    await messages.doc(message.id).set(message.toJson());
  }

  Future<void> increaseVisits() async {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    String id = '$month-$year';
    var doc = await visits.doc(id).get();
    if (doc.exists) {
      await visits.doc(id).get().then((value) async {
        final docs = value.data()!;
        final data = docs as Map<String, dynamic>;
        List list = data['visits'] as List;
        Visits v = Visits(visits: list);
        v.visits[day - 1]++;
        await visits.doc(id).set(v.toJson());
      });
    } else {
      await visits.doc(id).set(Visits(visits: []).ifNotExiststoJson());
      increaseVisits();
    }
  }
}
