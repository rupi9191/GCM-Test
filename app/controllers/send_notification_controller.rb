require 'gcm'
class SendNotificationController < ApplicationController
  def index
  end
  def sendNotification
    gcm = GCM.new(params[:apikey]) #GCM.new("AIzaSyA1mo5MYvFaqt4FMEaX7AMpmbKREWk-fY4")
    registration_ids= [params[:regid]] #["APA91bHX7MQ_0czeGFCauGi-_V-6-o-a0Yq0Ike3ao4ylpCp0uDgPq2fVZZpMbwQ2bwanwh0kNorv1BnF4CEE-sU4WeIwBCs49ukcWWA0SsiDWr6muGsVQHqXPoF3Z4g6MutBDUoqFIsOYffwGlrm1KtKYJcQuNcCA"]
     # an array of one or more client registration IDs
    options = {data: {message: params[:message]}, collapse_key: "message"}
    response = gcm.send(registration_ids, options)
    render response
  end
end
