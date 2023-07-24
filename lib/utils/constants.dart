
const String base_url = "http://10.0.2.2:3001/";
//auth
const String register = "auth/register";
const String login = "auth/login";
// Carpool
String get_users_url(String id) => "users/${id}";

//Carpool Passengers
const String get_rides ="rides/getRides";
const String book_rides ="rides/bookRides";
String get_my_booked_rides(String id) => "rides/getMyBookedRides/${id}";
const String cancel_rides ="rides/cancelRides";
//Carpool Rider
String get_rider_rides(String id)=>"rides/rider/getMyPostedRides/${id}";
String rider_delete_ride(String id)=>"rides/rider/deleteRide/${id}";
String get_rider_passengers(String id)=>"rides/rider/getMyPassengers/${id}";
const String rider_post_ride = "rides/rider/postRide";
const String rider_update_ride = "rides/rider/updateRide";

//EV
const String get_stations="evuser/getStations";
const String add_station="evuser/addstation";
const String update_station="evuser/updateStation";
const String delete_station="evuser/deleteStation";
//Ev Admin
const String verify_admin_station="evadmin/verifyAdminStation";
const String delete_admin_station="evadmin/deleteAdminStation";



