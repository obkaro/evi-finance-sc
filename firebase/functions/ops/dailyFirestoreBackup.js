const functions = require('firebase-functions');
const admin = require('firebase-admin');

const firestore = require('@google-cloud/firestore');
const client = new firestore.v1.FirestoreAdminClient();

// BACKUP FIRESTORE
const bucket = 'gs://evi-prod-backups';

exports.dailyFirestoreBackup = functions.pubsub
                                            .schedule('every 24 hours')
                                            .onRun((context) => {

  const projectId = process.env.GCP_PROJECT || process.env.GCLOUD_PROJECT;
  const databaseName = 
    client.databasePath(projectId, '(default)');

  return client.exportDocuments({
    name: databaseName,
    outputUriPrefix: bucket,
    // Leave collectionIds empty to export all collections
    // or set to a list of collection IDs to export,
    // collectionIds: ['users', 'posts']
    collectionIds: []
    })
  .then(responses => {
    const response = responses[0];
    console.log(`Operation Name: ${response['name']}`);
    return;
  })
  .catch(err => {
    console.error(err);
    throw new Error('Export operation failed');
  });
});