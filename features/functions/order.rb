def create_order
  @order = HTTParty.post($api['create_search_order'], 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg==',
      'Content-Type' => 'application/json'},
      body: @body)

  puts "\n\nTHE ENDPOINT CALLED AND THE BODY SENT TO CREATE A ORDER\n"
  puts $api['create_search_order']
  puts "\n"
  puts @body

  puts "\n\nTHE RESPONSE BODY\n"
  puts (@order.body).force_encoding(Encoding::UTF_8)
  @getOrder = JSON.parse(@order.body, object_class: OpenStruct)
end

def generic_order_payload
{  
  "ownId" => (Faker::Name.first_name+'_WCO').to_s,
  "amount"=> {  
    "currency" => "BRL",
    "subtotals"=> {  
        "shipping" => Faker::Number.between(2050, 8090)
      }
    },
    "items" => [  
      {  
        "product" => Faker::Commerce.product_name,
        "category" => ["CLOTHING","PHOTOGRAPHY", "3D_PRINTERS", "AUDIO", "VIDEO"].sample, 
        "quantity" => 5,
        "detail" => Faker::Lorem.sentence(3),
        "price" => Faker::Number.between(1050, 18090)
      }
    ],
    "customer" => @customer
}.to_json
end

def search_order
 @search = HTTParty.get($api['create_search_order']+@orderID, 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg=='})
end

def order_payload_with_customer
{  
  "ownId" => (Faker::Name.first_name+'_WCO').to_s,
  "amount"=> {  
    "currency" => "BRL",
    "subtotals"=> {  
        "shipping" => Faker::Number.between(2050, 8090)
      }
    },
    "items" => [  
      {  
        "product" => Faker::Commerce.product_name,
        "category" => ["CLOTHING","PHOTOGRAPHY", "3D_PRINTERS", "AUDIO", "VIDEO"].sample, 
        "quantity" => 5,
        "detail" => Faker::Lorem.sentence(3),
        "price" => Faker::Number.between(1050, 18090)
      }
    ],
    "customer" => customer_payload
}.to_json
end

