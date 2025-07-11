import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "collaborators" field.
  List<DocumentReference>? _collaborators;
  List<DocumentReference> get collaborators => _collaborators ?? const [];
  bool hasCollaborators() => _collaborators != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "statusDate" field.
  DateTime? _statusDate;
  DateTime? get statusDate => _statusDate;
  bool hasStatusDate() => _statusDate != null;

  // "dueDate" field.
  DateTime? _dueDate;
  DateTime? get dueDate => _dueDate;
  bool hasDueDate() => _dueDate != null;

  void _initializeFields() {
    _subject = snapshotData['subject'] as String?;
    _description = snapshotData['description'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _collaborators = getDataList(snapshotData['collaborators']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _statusDate = snapshotData['statusDate'] as DateTime?;
    _dueDate = snapshotData['dueDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? subject,
  String? description,
  DocumentReference? owner,
  DateTime? createdDate,
  String? status,
  DateTime? statusDate,
  DateTime? dueDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subject': subject,
      'description': description,
      'owner': owner,
      'createdDate': createdDate,
      'status': status,
      'statusDate': statusDate,
      'dueDate': dueDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return e1?.subject == e2?.subject &&
        e1?.description == e2?.description &&
        e1?.owner == e2?.owner &&
        listEquality.equals(e1?.collaborators, e2?.collaborators) &&
        e1?.createdDate == e2?.createdDate &&
        e1?.status == e2?.status &&
        e1?.statusDate == e2?.statusDate &&
        e1?.dueDate == e2?.dueDate;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.subject,
        e?.description,
        e?.owner,
        e?.collaborators,
        e?.createdDate,
        e?.status,
        e?.statusDate,
        e?.dueDate
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
