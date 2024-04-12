# TechShila RKB Submission

## Getting Started
# ts_app
# ts_app
Clone this repository

https://github.com/usmanIITR/ts_app.git
Migrate to the root directory and install all the required dependencies by running

1. flutter pub get
2. Create MongoDB Project & Cluster
3. Connect to the cluster using Drivers and get the connection string.
4. Put that connection string in server/index.js
5. Head to constants/Globalveriables.dart and replace the uri with your IP address.
6. Create Cloudinary Project, and enable the unsigned operation in settings.
7. Head to lib\features\admin\services\admin_service.dart, update the cloudinaryCloudName and cloudinaryUploadPreset present in the uploadImages() method.

Now, run the following commands, to migrate to the server folder, install the necessary dependencies, and run the server locally.

1. cd server
2. npm install
3. npm run dev (to run index.js using nodemon)
    OR
    npm start (to run index.js)