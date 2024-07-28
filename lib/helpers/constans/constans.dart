// Service locators instances name
const mainInstance = 'mainInstance';

// Database consts
const databaseName = 'users_groups.db';
const usersTable = 'Users';
const groupsTable = 'Groups';
const usersGroupsTable = 'UsersGroups';

// const query = ''' SELECT 
//   $usersTable.id as userId, 
//   $usersTable.name as name,
//   $usersTable.lastName as lastName,
//   $usersTable.streetName as streetName,
//   $usersTable.postalCode as postalCode,
//   $usersTable.cityName as cityName,
//   $groupsTable.id as groupId,
//   $groupsTable.name as name
//   FROM $usersTable
//   JOIN $usersGroupsTable ON $usersGroupsTable.userId = users.id
//   JOIN $groupsTable on $groupsTable.groupId = $usersGroupsTable.groupId
//    ''';

// const query = ''' SELECT
//   $usersTable.id,
//   $usersTable.name,
//   $usersTable.lastName,
//   $usersTable.streetName,
//   $usersTable.postalCode,
//   $usersTable.cityName,
//   $groupsTable.id,
//   $groupsTable.name
//   FROM $usersTable
//   JOIN $usersGroupsTable ON $usersGroupsTable.userId = $usersTable.id
//   JOIN $groupsTable ON $groupsTable.id = $usersGroupsTable.groupId
//    ''';
