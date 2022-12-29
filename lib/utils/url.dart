const baseUrl = "http://192.168.1.158:8000/";
// const baseUrl = "http://localhost:8000/";



const getAllEvent = "api/event-type";
const getFilteredVenue = "api/venue?";

const getAllTheme = "api/theme";

const getAllDrinks = "api/drink/?";

const getAllCakes = "api/cake/available";

const getAllDecoration = "api/decoration/available";

const loginUrl = "api/user/login";
const registerUrl = "api/user/register";
const updateProfileUrl = "api/user/update";

// OTP
const verifyotp = "api/user/verify-otp";
const resendotp = "api/user/resend-otp";
const viewUserProfile = "api/user/profile";

const postTransactionUrl = "api/event/";

// User auth 
const forgotPasswordUrl = "api/user/forgot-password";
const resetPasswordUrl = "api/user/reset-password";
const changePasswordUrl = "api/user/change-password";

// Announcement
const getAllAnnouncement = "api/announcement/";


// chat
const insertChat  ="api/chat";
const getStaffChat = "api/user/chat-contact";
String? token;
String? id;
