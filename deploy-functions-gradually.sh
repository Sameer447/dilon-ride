#!/bin/bash

echo "Starting gradual Firebase functions deployment..."

# Batch 1: Core functions
echo "Deploying Batch 1: Core functions..."
firebase deploy --only functions:get_providers,functions:get_settings,functions:get_bookinglist,functions:get_estimates,functions:get_trip_history,functions:get_drivers,functions:get_users,functions:get_cancel_reasons,functions:get_car_types,functions:get_payments,functions:get_earnings,functions:get_sos,functions:get_notifications,functions:get_languages,functions:get_locations,functions:get_promos,functions:get_referrals,functions:get_withdraws,functions:get_tasks,functions:get_chats,functions:get_complaints,functions:get_fleetadmin_earnings,functions:get_earningreports,functions:get_usedreferrals,functions:get_sms,functions:get_smtp,functions:get_appcat

sleep 30

# Batch 2: Auth functions
echo "Deploying Batch 2: Auth functions..."
firebase deploy --only functions:user_signup,functions:user_signin,functions:user_signout,functions:user_delete,functions:user_update,functions:user_validate_referral,functions:user_add_money_to_wallet,functions:user_get_wallet_history,functions:user_send_notification,functions:user_update_push_token

sleep 30

# Batch 3: User management functions
echo "Deploying Batch 3: User management functions..."
firebase deploy --only functions:driver_signup,functions:driver_signin,functions:driver_signout,functions:driver_update,functions:driver_delete,functions:driver_validate_referral,functions:driver_add_money_to_wallet,functions:driver_get_wallet_history,functions:driver_send_notification,functions:driver_update_push_token

sleep 30

# Batch 4: Basic payment functions
echo "Deploying Batch 4: Basic payment functions..."
firebase deploy --only functions:create_payment_intent,functions:confirm_payment,functions:refund_payment,functions:get_payment_methods,functions:update_payment_method,functions:delete_payment_method

sleep 30

# Batch 5: Booking functions
echo "Deploying Batch 5: Booking functions..."
firebase deploy --only functions:create_booking,functions:update_booking,functions:cancel_booking,functions:accept_booking,functions:start_trip,functions:end_trip,functions:rate_trip,functions:get_booking_details

echo "Gradual deployment completed!"
