def create_customer
  @customer = HTTParty.post($api['create_list_customers'], 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg==',
      'Content-Type' => 'application/json'},
    body: full_customer_payload)

  puts "\n\nTHE ENDPOINT CALLED AND THE BODY SENT TO CREATE A NEW CUSTOMER\n"
  puts $api['create_list_customers']
  puts "\n"
  puts full_customer_payload

  puts "\n\nTHE RESPONSE BODY\n"
  puts (@customer.body).force_encoding(Encoding::UTF_8) 
  @getCustomer = JSON.parse(@customer.body, object_class: OpenStruct)
end

def full_customer_payload
  {  
     "ownId" =>(Faker::Name.first_name+'_WCC').to_s, 
     "fullname" => (Faker::Name.name_with_middle).to_s,
     "email" => (Faker::Name.first_name+'@wirecard.com').to_s,
     "birthDate" => (Faker::Date.birthday(18, 65)).to_s,
     "taxDocument":{  
        "type" => "CPF",
        "number" => (Faker::Number.number(11)).to_s
     },
     "phone":{  
        "countryCode" => "55",
        "areaCode" => "11",
        "number" =>(Faker::Number.number(9)).to_s
     },
     "shippingAddress":{  
        "city" => (Faker::Address.city).to_s,
        "district" =>(Faker::Address.community).to_s,
        "street" =>(Faker::Address.street_name).to_s,
        "streetNumber" =>(Faker::Address.building_number).to_s,
        "zipCode" => (Faker::Number.number(8)).to_s,
        "state" => (Faker::Address.state).to_s,
        "country" => (Faker::Address.country_code_long).to_s
     },
     "fundingInstrument":{  
        "method" =>"CREDIT_CARD",
        "creditCard":{  
           "expirationMonth" => (Faker::Number.between(1, 12)).to_s,
           "expirationYear" => (Faker::Number.between(2019, 2030)).to_s,
           "number" => "5272585760013391",
           "cvc" => (Faker::Number.number(3)).to_s,
           "holder":{  
              "fullname" => (Faker::Name.name_with_middle).to_s,
              "birthdate" =>(Faker::Date.birthday(18, 65)).to_s,
              "taxDocument":{  
                 "type" =>"CPF",
                 "number" => (Faker::Number.number(11)).to_s
              },
              "billingAddress":{  
                 "city" => (Faker::Address.city).to_s,
                 "district" => (Faker::Address.community).to_s,
                 "street" => (Faker::Address.street_name).to_s,
                 "streetNumber" => (Faker::Address.building_number).to_s,
                 "zipCode" => (Faker::Number.number(8)).to_s,
                 "state" => (Faker::Address.state).to_s,
                 "country" => (Faker::Address.country_code_long).to_s
              },
              "phone":{  
                 "countryCode" =>"55",
                 "areaCode" =>"11",
                 "number" => (Faker::Number.number(9)).to_s
              }
           }
        }
     }
  }.to_json
end

def simple_customer_payload
  {  
     "ownId" =>(Faker::Name.first_name+'_WCC').to_s, 
     "fullname" => (Faker::Name.name_with_middle).to_s,
     "email" => (Faker::Name.first_name+'@wirecard.com').to_s,
     "birthDate" => (Faker::Date.birthday(18, 65)).to_s,
     "taxDocument":{  
        "type" => "CPF",
        "number" => (Faker::Number.number(11)).to_s
     },
     "phone":{  
        "countryCode" => "55",
        "areaCode" => "11",
        "number" =>(Faker::Number.number(9)).to_s
     },
     "shippingAddress":{  
        "street" =>(Faker::Address.street_name).to_s,
        "streetNumber" =>(Faker::Address.building_number).to_s,
        "complement" => (Faker::Address.secondary_address).to_s,
        "district" =>(Faker::Address.community).to_s,
        "city" => (Faker::Address.city).to_s,
        "state" => (Faker::Address.state).to_s,
        "country" => (Faker::Address.country_code_long).to_s,
        "zipCode" => (Faker::Number.number(8)).to_s
     }
  }
end

def list_all_customers
  HTTParty.get($api['create_list_customers'], 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg=='})
end

def search_customer
  @search_customer =  HTTParty.get($api['create_list_customers']+@customerId, 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg=='})
end