json.array!(@contacts) do |contact|
  json.extract! contact, :id, :fname, :lname, :email, :phone, :street, :city, :state, :done
  json.url contact_url(contact, format: :json)
end
