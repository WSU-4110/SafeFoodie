class CloudStorageException implements Exception {
  const CloudStorageException();
}

// Create exception in CRUD
class CouldNotCreateNoteException extends CloudStorageException {}

// Read exception in CRUD
class CouldNotGetAllNotesException extends CloudStorageException {}

// Update exception in CRUD
class CouldNotUpdateNoteException extends CloudStorageException {}

// Delete exception in CRUD
class CouldNotDeleteNoteException extends CloudStorageException {}
